require_relative 'bot'

module Telegram
  class Internal < Bot
    BOT_NAME  = :dcl_metrics_internal_bot
    CHAT_ID   = ENV['TELEGRAM_INTERNAL_TARGET_ID']

    def self.handle_request(data)
      new(data).handle_request
    end

    def initialize(data)
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

      payload.each do |key, value|
        text += "#{key}: #{sanitize(value)}\n"
      end

      text
    end

    def sanitize(value)
      return value unless value.class == String

      # I have no idea why semi-colons fuck up telegram's rendering but they do
      value.gsub!(';', ',')
      value
    end

    def bot_name
      BOT_NAME
    end

    def chat_id
      CHAT_ID
    end
  end
end
