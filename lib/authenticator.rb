require 'bcrypt'

class Authenticator
  NAME = 'foo'
  PASSWORD = BCrypt::Password.create('bar')

  def self.authenticate?(name, password)
    NAME == name && PASSWORD == password
  end
end
