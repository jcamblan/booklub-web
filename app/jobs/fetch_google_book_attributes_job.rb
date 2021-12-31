# frozen_string_literal: true

require 'open-uri'

class FetchGoogleBookAttributesJob < ApplicationJob
  queue_as :default

  def perform(book_id)
    book = Book.find(book_id)

    base_uri = 'https://www.googleapis.com/books/v1/volumes/'

    result = RestClient.get(base_uri + book.google_book_id)
    json = JSON.parse(result.body).deep_symbolize_keys

    book.update!(
      title: json.dig(:volumeInfo, :title),
      authors: (json.dig(:volumeInfo, :authors) || []).map do |name|
                 Author.find_or_initialize_by(name: name)
               end
    )
    return if json.dig(:volumeInfo, :imageLinks).nil?

    prio = %i[large extraLarge medium small thumbnail smallThumbnail]
    file_url = json.dig(:volumeInfo, :imageLinks)
                   .sort_by { |k, _v| prio.index(k) }
                   &.first&.last
    return unless file_url

    file = URI.parse(file_url).open

    book.cover.attach(io: file, filename: 'cover')

    book.save!
  end
end
