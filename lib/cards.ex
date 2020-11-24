defmodule Cards do
  @moduledoc """
  methods for creating and handling a deck of cards.
  """


  @doc """
  arity is 0
  returns a list of playing cards in the form a string joker is not included in the deck

  """
  def create_deck do
    values = ["Ace",2,3,4,5,6,7,8,9,10,"Jack","King","queen"]
    suits = ["hearts","clubs","diamond","spades"]

    for value <- values ,suit <- suits do
      "#{value} of #{suit}"
    end

    # cards = for value <- values do
    #   for suit <- suits do
    #     "#{value} of #{suit}"
    #   end
    # end
    # List.flatten(cards)
  end



  @doc """
  arity is 1
  takes the list returned from create_deck and shuffles
   the cards to different random position then
    the new shuffled deck is returned
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end
@doc """
arity is 2
returns a boolean true or false checking if a particular card i in the deck
  ## Example
      iex> deck = Cards.create_deck()
      iex> Cards.contains?(deck,"Ace of clubs")
      true
"""
  def contains?(deck,hand) do
    Enum.member?(deck,hand)
  end

@doc """
arity is 2
returns a hand of with a paricular
number requested the number requested is passed in
as the 2nd argument with the deck being the first argument
  ## Example

      iex> deck = Cards.create_deck()
      iex> hand = Cards.deal(deck,1)
      iex> hand
      ["Ace of hearts"]
"""

  def deal(deck,deal) do
   {first,_} = Enum.split(deck,deal)
    first
  end
@doc """
saves the particular deck to file
"""
  def save(deck,filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename,binary)
  end
  @doc """
  loads data from a file
  """

  def load(filename) do
    {status,binary} = File.read(filename)
    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "file does not exist"
    end
    #:erlang.binary_to_term(binary)
  end
  @doc """
  combines create_deck, shuffle and deal all into one function
  """
  def flop(hand_size) do
    # deal = Cards.create_deck()
    # deal = Cards.shuffle(deal)
    # hand = Cards.deal(deal,hand_size)
    # hand
     Cards.create_deck |> Cards.shuffle() |> Cards.deal(hand_size)



  end

end
