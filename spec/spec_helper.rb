PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)


require 'simplecov'

SimpleCov.start do
  root(File.join(File.dirname(__FILE__), '../'))
  add_filter '/spec/'
  add_filter '/features/'
end


require File.expand_path(File.dirname(__FILE__) + "/../config/boot")


RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end



def app
  ##
  # You can handle all padrino applications using instead:
  #   Padrino.application
  LogDeTareas::App.tap { |app|  }
end




