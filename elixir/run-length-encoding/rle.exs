defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.split("", trim: true)
    |> Enum.reduce(
         %{},
         fn(letter, count) ->
           Map.put(count, letter, Map.get(count, letter, 0) + 1)
         end
       )
#   At this point letters seem to be ending up in wrong order.
    |> Enum.reduce(
         "",
         fn({letter, count}, string) ->
           string <> Integer.to_string(count) <> letter
         end
       )
  end

  @spec decode(String.t) :: String.t
  def decode(string) do

  end
end
