def take_card(deck)
    limit = deck.deck.length - 1
    random = rand(0..limit)
    card = deck.deck[random]
    current_cards << card
    deck.deck.delete(card)
  end

  def take_2_cards(deck)
    2.times do
      take_card(deck)
    end
  end

  def show_cards
    cards = []
    current_cards.each { |card| cards << "#{card.suit}#{card.name}" }
    cards.join(' ')
  end

  def can_take_card?
    current_cards.length < 3
  end
end
