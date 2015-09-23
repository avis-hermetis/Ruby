require_relative 'points_count.rb'
class User
  attr_accessor :hand
  attr_accessor :points
  attr_reader :name

  include PointsCount

  def initialize(name)
    @name = name
    @points = 0
    @hand = []
    @deck = Deck.new
  end
end
