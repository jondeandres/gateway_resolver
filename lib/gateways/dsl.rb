class DSL
  attr_accessor :object, :restrictions

  def initialize(object)
    @object = object
    @restrictions = []
  end

  def with(attribute, value)
    restrictions << proc do
      object.send(attribute) == value
    end
  end

  def run
    restrictions.all? {|restriction| restriction.call }
  end
end
