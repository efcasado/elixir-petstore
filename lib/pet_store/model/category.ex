defmodule PetStore.Model.Category do
  @moduledoc """
  
  """

  @derive JSON.Encoder
  defstruct [
    :id,
    :name
  ]

  @type t :: %__MODULE__{
    :id => integer() | nil,
    :name => String.t | nil
  }

  def decode(value) do
    value
  end
end

