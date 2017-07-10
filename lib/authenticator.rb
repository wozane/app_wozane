class Authenticator
  NAME = 'foo'
  PASSWORD = 'bar'

  def self.authenticate?(name, password)
    NAME == name && PASSWORD == password
  end
end
