defmodule Bob do
  def hey(input) do
    cond do
      !contains_characters(input) -> "Fine. Be that way!"
      is_question(input) -> "Sure."
      is_shouting(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp is_question(input) do
    String.ends_with?(input, "?")
  end

  defp is_shouting(input) do
    !string_is_capitalised(input) && string_is_upcase(input)
  end

  defp contains_characters(input) do
    String.match?(input, ~r/\w/u)
  end

  defp string_is_upcase(input) do
    String.upcase(input) == input
  end

  defp string_is_capitalised(input) do
    String.capitalize(input) == input
  end
end
