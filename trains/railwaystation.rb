class RailwayStation
  attr_reader :name

  @@all = []
  def self.all
    puts @@all
  end

  attr_reader :name

  def initialize(name)
    @name = name
    @train_list = []
    @@all.push(name)
  end

  def accept(train)
    @train = train
    @train[:time_arrival] = Time.now
    @train_list << @train
  end

  def do_smth_with_trains(&block)
    block.call(@train_list)
  end

  def send
    @train_list.shift
  end

  def terminal
    puts "Количество поездов на станции #{@name}: #{@train_list.size}"
    list_trains
  end

  def type
    puts 'Грузовые составы на станции'
    cargo_list
    puts 'Пассажирские поезда на станции'
    passenger_list
  end

  private

  def list_trains
    @train_list.each_with_index do |train, index|
      puts "В очереди на отправление #{index + 1}, #{train[:type]},
      кол-во вагонов #{train[:wagons]}, время прибытия #{train[:time_arrival]}"
    end
  end

  def cargo_list
    train_list.each_with_index do |train, index|
      puts "В очереди на отправление #{index + 1}, #{train[:type]},
      кол-во вагонов #{train[:wagons]}, время прибытия #{train[:time_arrival]}" if train[:type] == 'cargo'
    end
  end

  def passenger_list
    train_list.each_with_index do |train, index|
      puts "В очереди на отправление #{index + 1}, #{train[:type]},
      кол-во вагонов #{train[:wagons]}, время прибытия #{train[:time_arrival]}" if train[:type] == 'passenger'
    end
  end
end
