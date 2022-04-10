require "tmdb-client"

Tmdb::Client.configure do |config|
  config.api_key = "abc"
end


puts Tmdb::Client.api_key
