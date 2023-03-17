defmodule FactorTest do
  use ExUnit.Case

  import Factor

  test "fatctor of Full Test" do
    assert Factor.of(1) == []
    assert Factor.of(2) == [2]
    assert Factor.of(3) == [3]
    assert Factor.of(4) == [2, 2]
    assert Factor.of(5) == [5]
    assert Factor.of(6) == [2, 3]
    assert Factor.of(7) == [7]
    assert Factor.of(8) == [2, 2, 2]
    assert Factor.of(9) == [3, 3]
    assert Factor.of(2 * 2 * 3 * 5 * 7 * 11 * 11 * 13 * 17 * 19 * 19 * 19 * 19) == [2, 2, 3, 5, 7, 11, 11, 13, 17, 19, 19, 19, 19]
  end
end
