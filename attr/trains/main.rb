require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'railwaystation'
require_relative 'route'
require_relative 'passenger_w'
require_relative 'cargo_w'
c_wagon = CargoWagon.new
p_wagon = PassengerWagon.new
station_list = []
train_list = []

puts 'Добрый день!'
loop do
  menu = ['Если вы хотите добавить поезд введите команду: train ',
          'Если хотите хотите добавить станцию введите команду: station ',
          'Если вы хотите прицепить дополнительный вагон к поезду введите: add wagon ',
          'Если хотите отцепить вагон введите команду: detach wagon ',
          'Если вы хотите посмотреть список станций и поездов введите клманду: list ',
          'Если вы хотите выйти из программы введите клманду: exit ']
  puts menu

  case gets.chomp.downcase
  when 'train'
    puts 'Если хотите добавить грузовой поезд, введите команду cargo '
    puts 'Если хотите добавить пассажирский поезд, введите команду passenger '
    if gets.chomp.downcase == 'cargo'
      train_list.push(CargoTrain.new)
      p train_list

    else
      train_list.push(PassengerTrain.new)
      p train_list

    end
    next

  when 'station'
    puts 'Введите название станции'
    station_list.push(RailwayStation.new(gets.chomp.upcase))
    p station_list
    next
  when 'add wagon'
    puts 'Выберите поезд'
    train_list.each_with_index do |train, index|
      puts "#{index + 1}
    тип: #{train.train[:type]}, вагонов: #{train.train[:wagons]}"
    end
    puts 'Введите номер поезда к которому вы хотите добавить вагоны'
    chosen_train = train_list[gets.chomp.to_i - 1]
    puts 'Сколько выгонов вы хотите добавить?'
    number = gets.chomp.to_i
    if chosen_train.train[:type] == 'cargo'
      number.times { chosen_train.add_wagon(c_wagon) }
    else
      number.times { chosen_train.add_wagon(p_wagon) }
    end
    next
  when 'detach wagon'
    puts 'Выберите поезд'
    train_list.each_with_index do |train, index|
      puts "#{index + 1}
    тип: #{train.train[:type]}, вагонов: #{train.train[:wagons]}"
    end
    puts 'Введите номер поезда у которого вы хотите отцепить вагоны'
    chosen_train = train_list[gets.chomp.to_i - 1]
    puts 'Сколько выгонов вы хотите отцепить?'
    number = gets.chomp.to_i
    number.times { chosen_train.remove_wagon }
    next

  when 'list'
    puts 'Станции:'
    station_list.each { |station| puts "#{station.name} #{station.terminal}" }
    puts 'Поезда за пределами станции:'
    train_list.each_with_index do |train, index|
      puts "#{index + 1}
    тип: #{train.train[:type]}, вагонов: #{train.train[:wagons]}"
    end

    puts 'Введите номер поезда который вы хотите поместить на станцию'
    chosen_train = train_list[gets.chomp.to_i - 1]
    puts 'Введите название станции'
    chosen_station = station_list[0]
    station_list.each { |station| chosen_station = station if station.name.eql?(gets.chomp.upcase) }
    chosen_station.accept(chosen_train.train)
    next

  when 'exit'
    break
  else
    next
  end
end
