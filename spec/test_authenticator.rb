require 'minitest/pride'
require 'minitest/autorun'

require_relative '../lib/authenticator.rb'

class TestAuthenticator < MiniTest::Test
  def test_admin_has_correct_params
    assert Authenticator.authenticate?('foo', 'bar')
  end

  def test_admin_with_incorrect_params
    assert !Authenticator.authenticate?('foo', 'poo')
  end
end
