class Game
  def initialize
    @user = User.new(gets.chomp.capitalize)
    @user_money = 100
    @dealer_money = 100
  end

  def start
    puts "Начнем, #{@user.name}."
    puts 'Диллер раздает карты...'
    @user.hand = []
    @deck = Deck.new
    @dealer = Dealer.new

    dealing

    user_choice
    case line = gets.chomp.to_i
    when 1
      pass
    when 2
      take_another
    when 3
      showdown
    end
  end

  private

  def showdown
    puts 'Вскрываемся!'
    show_cards
    if @user.points > 21
      user_loses
    elsif  @user.points == @dealer.points
      draw
    elsif  @dealer.points > 21
      user_wins
    elsif @user.points > @dealer.points
      user_wins
    else
      user_loses
    end
    show_money
  end

  def user_wins
    show_points
    puts 'Поздравляю, вы победили!'
    @user_money += 10
    @dealer_money -= 10
  end

  def user_loses
    show_points
    puts 'Вы проиграли!'
    @user_money -= 10
    @dealer_money += 10
  end

  def draw
    show_points
    puts 'Ничья!'
  end

  def show_money
    puts " Деньги игрока: #{@user_money}"
    puts " Деньги диллера: #{@dealer_money}"
  end

  def show_points
    puts "Очки диллера: #{@dealer.points}"
    puts "Ваши очки: #{@user.points}"
  end

  def show_cards
    puts "Карты диллера: #{@dealer.hand}"
    puts "Ваши карты: #{@user.hand}"
  end

  def dealing
    2.times do
      @dealer.takes_card(@deck)
      @user.takes_card(@deck)
    end
    puts 'Диллер выкладывает свои карты на стол рубашкой вверх.'
    @dealer.hand.size.times { print '* ' }
    puts ''
    puts 'Ваш ход'
    puts @user.hand
    @user.points_count
    @dealer.points_count
  end

  def user_choice
    puts '1  Пропустить ход'
    puts '2  Добавить карту'
    puts '3  Открыть карты'
  end

  def pass
    puts 'Вы пропускаете ход.'
    puts 'Ход диллера...'
    @dealer.move(@deck)
    showdown
  end

  def take_another
    puts 'Вы берете карту.'
    @dealer.takes_card(@deck)
    @user.takes_card(@deck)
    @user.points_count
    puts 'Ход диллера...'
    @dealer.move(@deck)
    showdown
  end
end
