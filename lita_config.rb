Lita.configure do |config|
  # Bot name
  config.robot.name = 'unbot'

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
  if ENV.has_key? 'REDISTOGO_URL'
    config.redis[:url] = ENV.fetch('REDISTOGO_URL', nil)
    config.http.port = ENV.fetch('PORT', nil)
  end
end
