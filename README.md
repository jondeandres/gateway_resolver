# Gateway Resolver

## Basic usage

### Configuration

```ruby
g = Gateways.new

g.configure do
  gateway(:gateway1) do
    with(:device, 'device1')
  end

  gateway(:gateway2) do
    with(:device, 'device2')
    with(:country, 'fr')
  end

  gateway(:gateway3) do
    with(:country, 'uk')
  end

  gateway(:gateway4) do
    with(:country, 'es')
  end
end
```

### Resolving gateway

```ruby
require 'ostruct'
o1 = OpenStruct.new(country: 'uk')
o2 = OpenStruct.new(country: 'es')
o3 = OpenStruct.new(device: 'device1', country: 'uk')
o4 = OpenStruct.new(device: 'device2', country: 'es')
o5 = OpenStruct.new(device: 'device2', country: 'fr')

puts g.gateway_for(o1) # gateway3
puts g.gateway_for(o2) # gateway4
puts g.gateway_for(o3) # gateway1
puts g.gateway_for(o4) # gateway4
puts g.gateway_for(o5) # gateway2
```
