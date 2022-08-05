# BOT-SERVER

Home of all bots

## Telegram

### Internal Notifications Bot

Sends internal notifications to the designated telegram channel including
errors, debug output, bug reporting or other information.

#### Use

 * `level` [string] one of 'info', 'error' or 'critical'
 * `message` [string] message to deliver
 * `payload` [object, optional] key value object with additional parameters

```ruby
# ruby
require 'faraday'

URI = 'https://dcl-metrics-bot-server.herokuapp.com/telegram/internal'
params = {
  level: 'info',
  message: 'MTV makes me wanna smoke crack',
  payload: { artist: 'beck', album: 'MTV makes me wanna smoke crack' }
}.to_json

Faraday.post(URI, msg, "Content-Type" => "application/json")
```

#### Result

```
dcl-metrics internal notifications bot, [8/5/22 11:55 AM]
INFO:

MTV makes me wanna smoke crack

artist: beck
album: MTV makes me wanna smoke crack
```
