require 'bundler/setup'
Bundler.setup
Dir["#{File.dirname(__FILE__)}/../**/*.rb"].each { |f| require(f) }

RSpec.configure do |config|
  # some (optional) config here
end
