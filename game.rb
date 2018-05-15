# here will be the all rules of the games
require_relative 'gamer'
require_relative 'interface'
require_relative 'deck'

class Game
  attr_reader :gamer, :dealer, :deck, :interface

  ACTIONS_MENU = {
    1 => :dealers_turn,
    2 => :extra_card,
    3 => :reavel_cards
  }.freeze

  def initialize
    @interface = Interface.new
    @gamer = Gamer.new(interface.chose_name)
    @dealer = User.new
    start_game
  end

  def start_game
    @deck = Deck.new
    round
    show_cards_score
    interface.gamers_turn
  end

  def round
    @deck.cards.shuffle!
    @gamer.bet!
    @dealer.bet!
    @gamer.current_cards.clear
    @dealer.current_cards.clear
    @gamer.card_distribution(@deck)
    @dealer.card_distribution(@deck)
  end

  def show_cards_score
    puts "Текущие очки: #{@gamer.count_score}"
    @gamer.current_cards.each { |card| puts "#{card.lear}#{card.name} " }
    puts '--------------------------------------'
  end

  def gamers_turn
    @interface.action_gamers_turn
    choice = gets.chomp.to_i
    send ACTIONS_MENU[choice] if ACTIONS_MENU[choice]
    gamers_turn
  end

  def extra_card
    @gamer.take_card(@deck) if @gamer.current_cards.length < 3
    show_cards_score
  end

  def dealer_extra
    @dealer.take_card(@deck)
    @interface.dealer_extra
  end

  def dealers_turn
    @interface.dealers_turn
    sleep(1)
    return @interface.gamers_turn if @dealer.count_score >= 17
    dealer_extra if dealer.current_cards.length < 3
    @interface.gamers_turn
  end
end
