defmodule PetStore.Model.User do
  @moduledoc """
  
  """

  @derive JSON.Encoder
  defstruct [
    :id,
    :username,
    :firstName,
    :lastName,
    :email,
    :password,
    :phone,
    :userStatus
  ]

  @type t :: %__MODULE__{
    :id => integer() | nil,
    :username => String.t | nil,
    :firstName => String.t | nil,
    :lastName => String.t | nil,
    :email => String.t | nil,
    :password => String.t | nil,
    :phone => String.t | nil,
    :userStatus => integer() | nil
  }

  def decode(value) do
    value
  end
end

