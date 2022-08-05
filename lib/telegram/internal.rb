require_relative 'bot'

module Telegram
  class Internal < Bot
    BOT_NAME  = :dcl_metrics_internal_bot
    CHAT_ID   = ENV['TELEGRAM_INTERNAL_TARGET_ID']

    def self.handle_request(raw_request)
      new(raw_request).handle_request
    end

    def initialize(request, services = {})
      request.rewind
      data = JSON.parse(request.read)

      @level = data['level']
      @message = data['message']
      @payload = data['payload']
    end

    def handle_request
      self
    end

    def send
      send_message
    end

    private
    attr_reader :level, :message, :payload

    def text_to_send
      text = "#{level.upcase}:\n#{message}\n\n"
      payload.each { |k,v| text += "#{k}: #{v}\n" }

      text
    end

    def bot_name
      BOT_NAME
    end

    def chat_id
      CHAT_ID
    end
  end
end
