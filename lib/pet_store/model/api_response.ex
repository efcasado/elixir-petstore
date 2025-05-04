defmodule PetStore.Model.ApiResponse do
  @moduledoc """
  
  """

  @derive JSON.Encoder
  defstruct [
    :code,
    :type,
    :message
  ]

  @type t :: %__MODULE__{
    :code => integer() | nil,
    :type => String.t | nil,
    :message => String.t | nil
  }

  def decode(value) do
    value
  end
end

