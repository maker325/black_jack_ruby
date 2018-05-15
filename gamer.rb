require_relative 'user'

class Gamer < User
  attr_accessor :name

  def initialize(name = 'Gamer')
    @name = name
    super
  end
end
