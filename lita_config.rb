require './handlers/gif_limiter'

Lita.configure do |config|
  # Bot name
  config.robot.name = ENV.fetch('BOT_NAME', 'unbot')

  # Also use the '$' alias
  config.robot.alias = ENV['BOT_ALIAS'] if ENV.has_key? 'BOT_ALIAS'

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :info

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  config.robot.admins = ['U025V5AC3']

  # Use the Slack adapter
  config.robot.adapter = :slack
  config.adapters.slack.token = ENV['SLACK_TOKEN']

  # Configure redis using Redis To Go if on Heroku
  config.redis[:url] = ENV['REDIS_URL'] if ENV.has_key? 'REDIS_URL'

  # Set port if available
  config.http.port = ENV['PORT'] if ENV.has_key? 'PORT'

  # Configure Giphy API key
  config.handlers.giphy.api_key = ENV['GIPHY_API_KEY']

  # Configure forecast.io API key
  config.handlers.forecast.api_key = ENV['FORECAST_API_KEY']
end
