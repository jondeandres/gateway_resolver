$:.unshift(File.expand_path('../..', __FILE__))

require 'gateways/dsl'
require 'gateways/resolver'
require 'gateways/set'

class Gateways
  def configure(&block)
    set.instance_exec(&block)
  end

  def set
    @set ||= Set.new
  end

  def gateway_for(object)
    set.gateway_for(object)
  end
end
