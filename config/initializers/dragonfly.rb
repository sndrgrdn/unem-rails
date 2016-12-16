require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "ab9e4e2cf39444bf13ff7b2218ca317cf32a8ac2a5499313f103402c23a6eced"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')

  fetch_file_whitelist [
    /app\/assets\/images/,
  ]
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
