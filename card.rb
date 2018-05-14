class Card
  attr_reader :name, :lear, :value

  def initialize(name, lear, value)
    @name = name
    @lear = lear
    @value = value
  end

  def ace?
    name == 'Ace'
  end
end
