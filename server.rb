class Server < Sinatra::Application
  post '/telegram/internal' do
    require_relative 'lib/telegram/internal'
    Telegram::Internal.handle_request(request.body).send
  end
end
