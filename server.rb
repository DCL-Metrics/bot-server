require_relative 'lib/telegram/internal'

class Server < Sinatra::Application
  post '/telegram/internal' do
    request.rewind
    data = JSON.parse(request.body.read)

    Telegram::Internal.handle_request(data).send
  end
end
