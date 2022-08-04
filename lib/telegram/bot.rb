module Telegram
  class Bot
    def send_message
      Telegram::Broadcaster.send_message({
        bot: bot_name,
        chat_id: chat_id,
        text: text_to_send
      })
    end
  end
end
