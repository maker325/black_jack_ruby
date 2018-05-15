def calc_results
  case winner
  when @gamer
    @gamer.money += 20
    @interface.gamer_won(@gamer.money)
  when @dealer
    @dealer.money += 20
    @interface.dealer_won
  when 'draw'
    @gamer.money += 10
    @dealer.money += 10
    @interface.draw
  end
end

def winner
  return @gamer if @dealer.score > 21
  return @dealer if @gamer.score > 21
  return @gamer if @gamer.score > @dealer.score && @gamer.score <= 21
  return @dealer if @dealer.score > @gamer.score && @dealer.score <= 21
  'draw' if @dealer.score == @gamer.score
end
