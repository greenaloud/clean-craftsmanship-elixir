defmodule Factor do
  def of(n) when is_integer(n), do: _ofp(n, 2)

  defp _ofp(n, _divisor) when n <= 1, do: []
  defp _ofp(n, divisor) when rem(n, divisor) == 0, do: [ divisor | _ofp(div(n, divisor), divisor) ]
  defp _ofp(n, divisor), do: _ofp(n, divisor + 1)
end
