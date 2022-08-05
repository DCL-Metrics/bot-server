module Telegram
  class Broadcaster
    BASE_URI = "https://api.telegram.org"

    def self.tokens
      {
        dcl_metrics_internal_bot: ENV['TELEGRAM_INTERNAL']
      }
    end

    def self.send_message(params)
      bot = params.delete(:bot)
      uri = BASE_URI + "/bot#{tokens[bot]}/sendMessage"

      new(uri, params).send
    end

    def initialize(uri, params)
      @uri = uri
      @params = params
    end

    def send
      print "sending #{params} to #{uri}\n"

      `curl -s #{url} -F "chat_id=#{params[:chat_id]}" -F "text=#{params[:text]}"`
    end

    private
    attr_reader :params, :uri
  end
end
