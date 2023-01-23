# Nasa Fuel Calculator

Simple fuel calculator for NASA.

## Installation


```elixir
def deps do
  [
    {:nasa_fuel_calc, "~> 0.1.0"}
  ]
end
```

### Usage example
```elixir
Fuel.calculate(mass, program)

Fuel.calculate(28801, [{:launch, 9.807}, {:land, 1.62}, {:launch, 1.62}, {:land, 9.807}])
```


