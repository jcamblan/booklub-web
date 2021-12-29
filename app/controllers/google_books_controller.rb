# frozen_string_literal: true

class GoogleBooksController < ApplicationController
  require 'rest-client'

  def index
    render json: {} if search_params[:query].nil?

    base_uri = 'https://www.googleapis.com/books/v1/volumes'

    result = RestClient.get(base_uri, params: {
                              q: search_params[:query],
                              printType: 'books',
                              projection: 'lite',
                              langRestrict: 'fr',
                              maxResults: '20'
                            })
    json = JSON.parse(result.body).deep_symbolize_keys

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
