# here will be description of current game for gamer

require_relative 'game'

class Interface
  def initialize(main)
    @main = main
  end

  protected

  def chose_name
    puts 'Игра Black Jack.'
    puts 'Для начала введите своё имя:'
    gets.chomp
  end

  def action_gamers_turn
    puts 'Выберите действие:'
    puts '1. Пропустить. Передать ход диллеру.'
    puts '2. Взять одну карту.'
    puts '3. Открыть карты.'
  end

  def dealers_turn
    puts 'Диллер завершил свой ход.'
  end

  def dealer_extra
    puts 'Диллер взял дополнительную карту.'
  end

  def player_extra(bulean)
    return puts 'У вас уже три карты.' unless bulean
    puts 'Вы взяли дополнительную карту.'
  end

  def show_player(user)
    return puts user.name.to_s if user.name
    puts 'Диллер'
  end

  def show_cards_score(user)
    puts "Текущие деньги: #{user.count_score}"
    user.current_cards.each { |card| puts "#{card.lear}#{card.name} " }
    puts '--------------------------------------'
  end

  def current_money(money)
    puts "Ваши текущие деньги: #{money}"
  end

  def gamer_won
    puts 'Вы победили!'
  end

  def dealer_won
    puts 'Победил Дилер.'
  end

  def draw
    puts 'Ничья!'
  end

  def play_again?
    puts 'Раунд окончен. Продолжить игру?'
    puts '1. Да'
    puts '2. Нет'
  end
end
