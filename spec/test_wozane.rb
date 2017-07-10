ENV['RACK_ENV'] = 'test'

require 'minitest/pride'
require 'minitest/autorun'
require 'rack/test'

require_relative '../wozane'

class TestWozane < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Wozane
  end

  def test_it_checks_login_form
    get '/login'
    assert last_response.ok?
    assert_includes(last_response.body, 'Username')
    assert_includes(last_response.body, 'Password')
  end

  def test_it_checks_login_with_correct_params
    post '/login', { "username" => "foo", "password" => "bar"}
    assert last_response.redirect?
    assert_includes(last_response.location, '/admin')
  end

  def test_it_checks_logout_button_is_displayed
    post '/login', { "username" => "foo", "password" => "bar"}
    follow_redirect!
    assert_includes(last_response.body, 'logout')
  end
end
