defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "トランプが52枚生成されているか" do
    assert length(Cards.create_deck) == 52
  end
end
