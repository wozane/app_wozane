class Admin
  NAME = 'foo'
  PASSWORD = 'bar'

  attr_accessor :name, :password

  def initialize(name, password)
    @name = name
    @password = password
  end

  def authenticate?
    NAME == name && PASSWORD == password
  end
end
