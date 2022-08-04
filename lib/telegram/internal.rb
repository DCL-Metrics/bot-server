require_relative 'bot'

module Telegram
  class Internal < Bot
    BOT_NAME  = :dcl_metrics_internal_notifications_bot
    CHAT_ID   = ENV['TELEGRAM_INTERNAL_TARGET_ID']

    def self.handle_request(raw_request)
      new(raw_request).handle_request
    end

    # NOTE: this class doesn't use the telegram request cause it's basically
    # just a message forwarder - it is called by an external source with text to
    # pass along to a given CHAT_ID and it blindly does so. if it were to start
    # fielding user input from a telgram bot, then it would use the telgram
    # request object
    def initialize(request, services = {})
      request.rewind
      @data = JSON.parse(request.read)
      @text_to_send = @data['text']
    end

    def handle_request
      self
    end

    def send
      send_message
    end

    private
    attr_reader :request, :text_to_send

    def bot_name
      BOT_NAME
    end

    def chat_id
      CHAT_ID
    end
  end
end
