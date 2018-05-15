require_relative 'card'

class User
  attr_reader :current_cards, :score
  attr_accessor :money

  def initialize
    @money = 100
    @current_cards = []
    @score = 0
  end

  def bet!
    @money -= 10
  end

  def count_score
    @score = current_cards.sum(&:value)
    @score -= 10 if score > 21 && aces?
  end

  def card_distribution(deck)
    2.times do
      take_card(deck)
    end
  end

  def take_card(deck)
    card = deck.cards[0]
    current_cards << card
    deck.cards.delete(card)
  end

  private

  def aces?
    current_cards.any?(&:ace?)
  end
end
