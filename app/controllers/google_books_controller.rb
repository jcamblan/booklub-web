# frozen_string_literal: true

class GoogleBooksController < ApplicationController
  require 'rest-client'

  def index
    render json: {} if search_params[:query].nil?

    json = GoogleBooksApiClient.new.search(search_params[:query])

    @google_books = json[:items].select do |book|
      book.dig(:volumeInfo, :title).present? &&
        book.dig(:volumeInfo, :authors).present? &&
        book.dig(:volumeInfo, :imageLinks).present?
    end
  end

  def search_params
    params.permit(:query)
  end
end
