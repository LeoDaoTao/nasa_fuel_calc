defmodule Fuel do
  @moduledoc """
  Calculate fuel needed for landing/lauch program.
  Usage: Fuel.calculate(mass, program)
  """

  alias Program

  @spec calculate(pos_integer, Program.t) :: pos_integer
  def calculate(mass, program) do
    program
    |> Enum.reverse()
    |> Enum.reduce(0, fn {command, gravity}, acc -> fuel_required(mass + acc, gravity, command) + acc end)
  end

  defp fuel_required(mass, gravity, command, acc \\ 0)
  defp fuel_required(mass, _gravity, _command, acc) when mass <= 0, do: acc
  defp fuel_required(mass, gravity, command, acc) do
    fuel = fuel_calculation(mass, gravity, command)
    fuel_required(fuel, gravity, command, acc + fuel)
  end

  defp fuel_calculation(mass, gravity, command) do
    mass
    |> Kernel.*(gravity)
    |> orbital_command(command)
    |> trunc()
    |> maybe_fuel_required()
  end

  defp orbital_command(val, :land) do
    val
    |> Kernel.*(0.033)
    |> Kernel.-(42)
  end

  defp orbital_command(val, :launch) do
    val
    |> Kernel.*(0.042)
    |> Kernel.-(33)
  end

  defp maybe_fuel_required(weight) when weight >= 0, do: weight
  defp maybe_fuel_required(_weight), do: 0
end
