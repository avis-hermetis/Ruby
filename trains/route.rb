class Route
  attr_reader :route

  def initialize(from, to)
    @from = from
    @to = to
    @route = [@from.name, @to.name]
  rescue NoMethodError
    validate!
  end

  def add(station)
    route.insert(1, station.name)
    fail 'Вы пытаетесь добавить объект, который не является станцией' unless station.class == RailwayStation
  end

  def remove(station)
    puts 'Такой станции нет списке' if route.delete(station) == 'not found'
  end

  def list
    puts "Маршрут: #{@route.first} - #{@route.last}"
    route.each { |station| puts station }
  end

  def intermed_stations
    puts route[1..-2]
  end

  private

  def validate!
    fail 'Отправная станция не является объектом класса RailwayStation' if @from.class != RailwayStation
    fail 'Конечная станция не является объектом класса RailwayStation' unless @to.class == RailwayStation
    true
  end
end
