class CargoTrain < Train
  
  attr_accessor :train
  def initialize(number, route = %w(Москва Владивосток))
    @number = number
    @speed = 0
    @route = route
    @station_index = 0
    @current_point = @route[0]
    @next_point = @route[1]

    @train = { type: 'passenger', wagons: 0 }
    validate!
    @@number[@number] = self
  end

  def do_smth_with(&block)
    block.call(train[:wagons])
  end

  def add_wagon(wagon)
    train[:wagons] += 1
    fail 'Вы не можете присоединить пассажирский вагон
    к грузовому составу' if wagon.type == 'passenger'
    fail 'Вы не можете присоединять вагон на ходу' unless @speed.zero?
  end

  
end
