# No module documentation needed

module PointsCount
  def points_count
    @points = 0
    count = []
    @hand.each { |card| count << @deck.cards[card] }
    count.sort!
    sum_points
    @points
  end

  def takes_card(deck)
    @hand.push(deck.deck[0])
    deck.deck.shift
  end

  def sum_points
    count.each do |value|
      if @points > 10 && value == 11
        @points += 1
      else
        @points += value
      end
    end
  end
end
