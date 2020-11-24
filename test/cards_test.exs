defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "a deck is created with 50 cards" do
    deck = length(Cards.create_deck())
    assert deck == 52

    end

  test "that the deck is actually shuffled" do
    deck =Cards.create_deck()
    assert  deck != Cards.shuffle(deck)
  end

  # test "" do
  #   assert true == :true
  # end
end
