defmodule RpnCalc do
  def calculate(input) do
    input_list = String.split(input, " ")
    accumulate(input_list, [])
  end

  defp accumulate([first, second, third], _stack), do: do_operation(first, second, third)

  defp accumulate([first, second, third | tail], stack) do
    if is_operator(third) do
      result = do_operation(first, second, third)
      accumulate(stack ++ [result] ++ tail, [])
    else
      accumulate([second, third | tail], [first])
    end
  end

  defp do_operation(first, second, "+"), do: parse(first) + parse(second)
  defp do_operation(first, second, "-"), do: parse(first) - parse(second)
  defp do_operation(first, second, "/"), do: parse(first) / parse(second)
  defp do_operation(first, second, "*"), do: parse(first) * parse(second)

  defp is_operator(item), do: item == "+" || item == "-" || item == "/" || item == "*"

  defp parse(number) when is_integer(number), do: number

  defp parse(number) do
    {result, _} = Integer.parse(number)
    result
  end
end
