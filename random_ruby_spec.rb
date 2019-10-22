ENV['APP_ENV'] = 'test'

require 'test/unit'
require 'rack/test'
require_relative 'random_ruby'

class RandomRubyTest < Test::Unit::TestCase

  def test_it_says_hello_world
    browser = Rack::Test::Session.new(Rack::MockSession.new(Sinatra::Application))
    browser.get '/'
    assert browser.last_response.ok?
    assert_match /(Hi|Hello|Servus)/, browser.last_response.body.strip
  end

  def test_it_says_hello_to_a_person
    browser = Rack::Test::Session.new(Rack::MockSession.new(Sinatra::Application))
    browser.get '/', :name => 'Birsi'
    assert browser.last_response.body.include?('Birsi')
  end
end
