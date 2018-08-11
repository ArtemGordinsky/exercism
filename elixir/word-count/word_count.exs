defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.replace(~r/[^\w\s-]|[_"]/u, " ")
    |> String.downcase
    |> String.split(" ", trim: true)
    |> Enum.reduce(
         %{},
         fn(word, count) ->
           Map.put(count, word, Map.get(count, word, 0) + 1)
         end
       )
  end
end
