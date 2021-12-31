# frozen_string_literal: true

require 'rest-client'

class GoogleBooksApiClient
  BASE_URI = 'https://www.googleapis.com/books/v1/volumes'

  def search(string)
    get(BASE_URI, params: {
          q: string,
          printType: 'books',
          projection: 'lite',
          langRestrict: 'fr',
          maxResults: '20'
        })
  end

  def volume(google_book_id)
    get("#{BASE_URI}/#{google_book_id}")
  end

  private

  def get(uri, params: {})
    response = RestClient.get(uri,
                              params: params,
                              Accept: 'application/json')
    JSON.parse(response.body).deep_symbolize_keys
  rescue RestClient::ExceptionWithResponse => e
    e.response
  end
end
