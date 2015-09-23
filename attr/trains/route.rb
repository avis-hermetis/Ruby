class Route
  attr_reader :route
 
 validate :station, :type, RailwayStation

  def initialize(from, to)
    @from = from
    @to = to
    @route = [@from.name, @to.name]
    validate!
  end

  def add(station)
    @station = station
    route.insert(1, @station.name)
    validate!
  end

  def remove(station)
    @station = station
    validate!
    puts 'Такой станции нет списке' if route.delete(station) == 'not found'
  end

  def list
    puts "Маршрут: #{@route.first} - #{@route.last}"
    route.each { |station| puts station }
  end

  def intermed_stations
    puts route[1..-2]
  end

  
end
