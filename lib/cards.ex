defmodule Cards do
  @moduledoc """
  Cardsに関する説明です
  """

  @doc """
  create 52 cards
  """
  def create_deck do
    numbers = ["Ace","Two","Three","Four","Five","Six","Seven","Eight","Nine",
    "Ten","Jack","Queen","King",]

    suits = ["Space","Clover","Diamond","Heart"]

    for num <- numbers, suit <- suits do
      "#{num}_of#{suit}"
    end
  end

  @doc """
  shuffle the deck
  """

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  check the member and return true or false
  """
  def contains?(deck, str) do
    Enum.member?(deck, str)
  end

  @doc """
  split the deck
  ##Exsample
  ```
  iex> Cards.shuffle([1, 2, 3, 4, 5, 6])
  [1, 4, 3, 6, 5, 2]
  ```
  """

  def deal(deck, deal_size) do
    Enum.split(deck, deal_size)
  end

  @doc """
  save the list and write binary file
  """
  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name,binary)
  end

  @doc """
  load the binary file and return the list
  """
  def load(file_name) do
    {status, binary} = File.read(file_name)

    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "That file does not exitst"
    end

  end

end
