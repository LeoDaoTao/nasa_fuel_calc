defmodule FuelTest do
  use ExUnit.Case
  alias Fuel

  @earth 9.807
  @moon 1.62
  @mars 3.711

  @apollo_program [{:launch, @earth}, {:land, @moon}, {:launch, @moon}, {:land, @earth}]
  @mars_program [{:launch, @earth}, {:land, @mars}, {:launch, @mars}, {:land, @earth}]
  @passenger_program [{:launch, @earth}, {:land, @moon}, {:launch, @moon}, {:land, @mars}, {:launch, @mars}, {:land, @earth}]

  describe "calculate/2" do
    test "returns valid Apollo 11 simulation" do
      assert 51898 === Fuel.calculate(28801, @apollo_program)
    end

    test "returns valid Mars mission simulation" do
      assert 33388 === Fuel.calculate(14606, @mars_program)
    end

    test "returns valid passenger mission simulation" do
      assert 212161 === Fuel.calculate(75432, @passenger_program)
    end
  end
end
