defmodule SecretHandshake do
  use Bitwise

  @action_codes %{
    0b1 => "wink",
    0b10 => "double blink",
    0b100 => "close your eyes",
    0b1000 => "jump"
  }

  @reverse_code 0b10000

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    Enum.reduce(@action_codes, [], fn {bin_code, action}, commands ->
      if (code &&& bin_code) > 0 do
        commands ++ [action]
      else
        commands
      end
    end)
    |> maybe_reverse(code)
  end

  @spec maybe_reverse(commands :: list, code :: binary) :: list(String.t())
  defp maybe_reverse(commands, code) when (code &&& @reverse_code) > 0 do
    Enum.reverse(commands)
  end

  defp maybe_reverse(commands, _code) do
    commands
  end
end
