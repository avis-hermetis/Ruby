require_relative 'deck.rb'
require_relative 'dealer.rb'
require_relative 'user.rb'
require_relative 'game.rb'

puts 'Добрый день, игрок!'
puts 'Как ваше имя?'
game = Game.new
loop do
  game.start
  puts 'вы хотите продолжить игру?'
  puts 'Y/N?'
  case gets.chomp.downcase
  when 'y'
    next
  when 'n'
    break
  else
    puts "Введите 'Y' для продолжения или 'N' для выхода из игры"
  end
end
