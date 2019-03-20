defmodule RpnCalcTest do
  use ExUnit.Case
  doctest RpnCalc

  test "when input is 2 2 + returns 4" do
    assert RpnCalc.calculate("2 2 +") == 4
  end

  test "when input is 2 2 1 + - returns -1" do
    assert RpnCalc.calculate("2 2 1 + -") == -1
  end

  test "when input is 3 4 2 * - returns -1" do
    assert RpnCalc.calculate("3 4 2 * -") == -5
  end
end
