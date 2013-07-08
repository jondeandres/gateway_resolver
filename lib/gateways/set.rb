class Set
  attr_accessor :set

  def initialize
    self.set = []
  end

  def gateway(name, options = {}, &block)
    set << Resolver.new(name, options, &block)
  end

  def gateway_for(object)
    gateway = nil

    set.each do |resolver|
      if resolver.run(object)
        gateway = resolver.klass
        break
      end
    end

    gateway
  end
end
