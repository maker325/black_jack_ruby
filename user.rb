require_relative 'card'

class User
  attr_reader :current_cards, :score
  attr_accessor :money, :bet

  def initialize
    @money = 100
    @current_cards = []
    @score = 0
  end

  def bet!
    @money -= bet
  end

  def count_score
    @score = current_cards.sum(&:value)
    @score -= 10 if score > 21 && aces?
  end

  private

  def aces?
    current_cards.any?(&:ace?)
  end
end
