
module Validation
  def validate(*attributes)
    case attributes[1]
    when :presence
      class_variable_set :@@name, attributes[0]
      @name = attributes[0]
    when :format
      class_variable_set :@@number, attributes[0]
      class_variable_set :@@regexp, attributes[2]
    when :type
      class_variable_set :@@station, attributes[0]
      class_variable_set :@@type, attributes[2]
    else
      puts "Validation type unknown"
    end
  end

  def validate!
    raise "Name can`t be nil or empty string" if (class_variable_get :@@name) || (class_variable_get :@@name == "")
    raise "Number do not match format" if (class_variable_get :@@number) =~ (class_variable_get :@@regexp)
    raise "Not a RailwayStation class" if (class_variable_get :@@station).class == RailwayStation
    true
  end

  def validate?
    validate!
  rescue
    false
  end

end


class Test
  extend Validation
 validate  "A-ZZ", :format, /A-Z{0,3}/
end
  
