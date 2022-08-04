require 'net/http'

module Telegram
  class Broadcaster
    BASE_URI = "https://api.telegram.org"

    def self.tokens
      {
        dcl_metrics_internal: ENV['TELEGRAM_INTERNAL']
      }
    end

    def self.send_message(params)
      bot = params.delete(:bot)
      uri = BASE_URI + "/bot#{tokens[bot]}/sendMessage"

      new(uri, params).send
    end

    def self.send_photo(params)
      bot = params.delete(:bot)
      uri = BASE_URI + "/bot#{tokens[bot]}/sendPhoto"

      new(uri, params).send_photo
    end

    def initialize(uri, params)
      @uri = uri
      @params = params
    end

    def send
      Net::HTTP.post_form(URI(uri), params)
    end

    # this one is just easier with curl ¯\_(ツ)_/¯
    def send_photo
      `curl -s -F "chat_id=#{params[:chat_id]}" -F "photo=@#{params[:image_path]}" "#{uri}"`
    end

    private
    attr_reader :params, :uri
  end
end
