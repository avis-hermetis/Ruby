
module InstanceCounter
  module ClassMethods
    attr_accessor :instances

    def self.instances
      @@instances
    end
  end

  module InstanceMethods
    def initialize
      super
      register_instance
      puts 'Check'
    end

    protected

    def register_instance
      @@instances += 1
    end
  end
end
extend InstanceCounter::ClassMethods
include InstanceCounter::InstanceMethods
