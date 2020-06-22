# frozen_string_literal: true

Cloudinary.config do |config|
  config.cloud_name = ENV['cloud_name']
  config.api_key = ENV['api_key']
  config.api_secret = ENV['api_secret']
  config.secure = true
  config.cdn_subdomain = true
end
