
module Validation
  class << self
  def included(base)
    base.extend
    base.send :include, InstanceMethods
  end
  end

  module ClassMethods
    def validate(verifiable_var_name, *args)
      @validation = {}
      instance_variable_set :@validation, @validation.merge({verifiable_var_name => args})
    end
  end

  module InstanceMethods
    def validate!
      (self.class.instance_variable_get :@validation).each do |name, param|
        @verifiable_parameter = instance_variable_get "@#{name}"
        @validation_method_name = param[0]
        @valid_parameter = param[1]
      end
      send @validation_method_name
      true
    end

    def validate?
      validate!
    rescue
      false
    end

    protected

    def presence
      fail 'No name entered' if @verifiable_parameter.nil? || @verifiable_parameter == ''
    end

    def format
      fail 'Incorrect number format' if @verifiable_parameter !~ @valid_parameter
    end

    def type
      fail 'Wrong type of argument' unless @verifiable_parameter == @valid_parameter
    end
  end
end
