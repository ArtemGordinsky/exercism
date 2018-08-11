defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    case pling?(number) <> plang?(number) <> plong?(number) do
      "" -> Integer.to_string(number)
      x -> x
    end
  end

  defp pling?(number) when rem(number, 3) === 0, do: "Pling"

  defp pling?(number), do: ""

  defp plang?(number) when rem(number, 5) === 0, do: "Plang"

  defp plang?(number), do: ""

  defp plong?(number) when rem(number, 7) === 0, do: "Plong"

  defp plong?(number), do: ""

end
