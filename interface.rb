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

  def dealer_extra
    puts 'Диллер взял дополнительную карту.'
  end

  def dealers_turn
    puts 'Диллер завершил свой ход.'
  end
end
