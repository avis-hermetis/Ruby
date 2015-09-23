require_relative 'points_count.rb'
class Dealer
  attr_accessor :hand
  attr_reader :points
  attr_accessor :money
  attr_accessor :bank

  include PointsCount

  def initialize
    @points = 0
    @hand = []
    @user_hand = []
    @deck = Deck.new
  end

  def deals
    2.times do
      take_card
      card_to_user
    end
  end

  def move(deck)
    points_count
    if @points < 18
      takes_card(deck)
      points_count
    elsif @points == 22
      takes_card(deck)
      points_count
    end
  end
end
