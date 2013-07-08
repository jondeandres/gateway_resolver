class Resolver
  attr_accessor :name, :class_name, :evaluator

  def initialize(name, options = {}, &block)
    self.name = name
    self.class_name = options[:class_name] || name
    self.evaluator = block
  end

  def run(object)
    dsl = DSL.new(object)
    dsl.instance_exec(&evaluator)
    dsl.run
  end

  def klass
    # TODO: constantize class_name
    class_name
  end
end
