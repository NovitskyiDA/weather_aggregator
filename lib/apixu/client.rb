require 'apixu/errors'
require 'rest-client'
require 'json'

module Apixu
  class Client
    attr_reader :api_key

    BASE_URL = 'https://api.apixu.com/v1'.freeze

    def initialize(api_key = nil)
      @api_key = api_key || ENV['APIXU_API_KEY']

      raise Errors::InvalidKey unless @api_key
    end

    def current(city)
      request(:current, q: city)
    end

    def forecast(city, days = 1)
      request(:forecast, q: city, days: days.between?(1, 10) ? days : 1)
    end

    private

    def request(type, params = {})
      params[:key] = @api_key

      response = JSON.parse(RestClient.get(BASE_URL + "/#{type}.json", params: params))

      response[:error] ? bad_request_error(response) : response
    end

    def bad_request_error(response)
      raise Errors::Request.new(response['error']['code'], response['error']['message'])
    end
  end
end
