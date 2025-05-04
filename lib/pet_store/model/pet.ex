defmodule PetStore.Model.Pet do
  @moduledoc """
  
  """

  @derive JSON.Encoder
  defstruct [
    :id,
    :name,
    :category,
    :photoUrls,
    :tags,
    :status
  ]

  @type t :: %__MODULE__{
    :id => integer() | nil,
    :name => String.t,
    :category => PetStore.Model.Category.t | nil,
    :photoUrls => [String.t],
    :tags => [PetStore.Model.Tag.t] | nil,
    :status => String.t | nil
  }

  alias PetStore.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:category, :struct, PetStore.Model.Category)
     |> Deserializer.deserialize(:tags, :list, PetStore.Model.Tag)
  end
end

