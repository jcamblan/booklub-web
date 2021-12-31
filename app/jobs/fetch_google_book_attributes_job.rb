# frozen_string_literal: true

require 'open-uri'

class FetchGoogleBookAttributesJob < ApplicationJob
  queue_as :default

  def perform(book_id)
    @book = Book.find(book_id)

    authors = (json.dig(:volumeInfo, :authors) || []).map do |name|
      Author.find_or_initialize_by(name: name)
    end
    @book.update!(title: json.dig(:volumeInfo, :title),
                  authors: authors)

    attach_cover if cover?
  end

  private

  def attach_cover
    file_url = json.dig(:volumeInfo, :imageLinks)
                   .sort_by { |k, _v| cover_priority.index(k) }
                   &.first&.last
    return unless file_url

    file = URI.parse(file_url).open

    @book.cover.attach(io: file, filename: 'cover')
    @book.save!
  end

  def json
    @json ||= GoogleBooksApiClient.new.volume(@book.google_book_id)
  end

  def cover?
    json.dig(:volumeInfo, :imageLinks).present?
  end

  def cover_priority
    %i[large extraLarge medium small thumbnail smallThumbnail]
  end
end
