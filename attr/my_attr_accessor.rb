module Attr
  def attr_accessor_with_history(*attr_array)
    attr_history = []
    attr_array.each do |attribute|
      
      define_method("#{attribute}=".to_sym) do |value|  
        instance_variable_set "@#{attribute}", value
        instance_variable_set "@#{attribute}_history", attr_history << value 
      end
      define_method("#{attribute}_history".to_sym) {instance_variable_get "@#{attribute}_history"}
      define_method("#{attribute}".to_sym) {instance_variable_get "@#{attribute}"}
    end
  end

  def strong_attr_accessor(*attribute_and_type)
    attribute = attribute_and_type[0]
    type = attribute_and_type[1]
     
       
    define_method("#{attribute}=".to_sym) do |value| 
      puts value.to_s
      puts @type.to_s
    raise "Type mismatch" unless value.class.to_s == type.to_s.capitalize
    instance_variable_set "@#{attribute}", value 
    end
    
    define_method(attribute.to_sym) {instance_variable_get "@#{attribute}" }
  end
end

 

class Test
  extend Attr
  attr_accessor_with_history :one, :two, :three
  strong_attr_accessor :attr, :Fixnum
end


