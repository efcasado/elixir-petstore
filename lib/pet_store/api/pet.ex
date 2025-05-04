defmodule PetStore.Api.Pet do
  @moduledoc """
  API calls for all endpoints tagged `Pet`.
  """

  alias PetStore.Connection
  import PetStore.RequestBuilder

  @doc """
  Add a new pet to the store.
  Add a new pet to the store.

  ### Parameters

  - `connection` (PetStore.Connection): Connection to server
  - `pet` (Pet): Create a new pet in the store
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, PetStore.Model.Pet.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec add_pet(Tesla.Env.client, PetStore.Model.Pet.t, keyword()) :: {:ok, nil} | {:ok, PetStore.Model.Pet.t} | {:error, Tesla.Env.t}
  def add_pet(connection, pet, _opts \\ []) do
    request =
      %{}
      |> method(:post)
      |> url("/pet")
      |> add_param(:body, :body, pet)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PetStore.Model.Pet},
      {400, false},
      {422, false},
      {:default, false}
    ])
  end

  @doc """
  Deletes a pet.
  Delete a pet.

  ### Parameters

  - `connection` (PetStore.Connection): Connection to server
  - `pet_id` (integer()): Pet id to delete
  - `opts` (keyword): Optional parameters
    - `:api_key` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec delete_pet(Tesla.Env.client, integer(), keyword()) :: {:ok, nil} | {:error, Tesla.Env.t}
  def delete_pet(connection, pet_id, opts \\ []) do
    optional_params = %{
      :api_key => :headers
    }

    request =
      %{}
      |> method(:delete)
      |> url("/pet/#{pet_id}")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false},
      {400, false},
      {:default, false}
    ])
  end

  @doc """
  Finds Pets by status.
  Multiple status values can be provided with comma separated strings.

  ### Parameters

  - `connection` (PetStore.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:status` (String.t): Status values that need to be considered for filter

  ### Returns

  - `{:ok, [%Pet{}, ...]}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec find_pets_by_status(Tesla.Env.client, keyword()) :: {:ok, nil} | {:ok, [PetStore.Model.Pet.t]} | {:error, Tesla.Env.t}
  def find_pets_by_status(connection, opts \\ []) do
    optional_params = %{
      :status => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/pet/findByStatus")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PetStore.Model.Pet},
      {400, false},
      {:default, false}
    ])
  end

  @doc """
  Finds Pets by tags.
  Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.

  ### Parameters

  - `connection` (PetStore.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:tags` ([String.t]): Tags to filter by

  ### Returns

  - `{:ok, [%Pet{}, ...]}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec find_pets_by_tags(Tesla.Env.client, keyword()) :: {:ok, nil} | {:ok, [PetStore.Model.Pet.t]} | {:error, Tesla.Env.t}
  def find_pets_by_tags(connection, opts \\ []) do
    optional_params = %{
      :tags => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/pet/findByTags")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PetStore.Model.Pet},
      {400, false},
      {:default, false}
    ])
  end

  @doc """
  Find pet by ID.
  Returns a single pet.

  ### Parameters

  - `connection` (PetStore.Connection): Connection to server
  - `pet_id` (integer()): ID of pet to return
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, PetStore.Model.Pet.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_pet_by_id(Tesla.Env.client, integer(), keyword()) :: {:ok, nil} | {:ok, PetStore.Model.Pet.t} | {:error, Tesla.Env.t}
  def get_pet_by_id(connection, pet_id, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/pet/#{pet_id}")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PetStore.Model.Pet},
      {400, false},
      {404, false},
      {:default, false}
    ])
  end

  @doc """
  Update an existing pet.
  Update an existing pet by Id.

  ### Parameters

  - `connection` (PetStore.Connection): Connection to server
  - `pet` (Pet): Update an existent pet in the store
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, PetStore.Model.Pet.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec update_pet(Tesla.Env.client, PetStore.Model.Pet.t, keyword()) :: {:ok, nil} | {:ok, PetStore.Model.Pet.t} | {:error, Tesla.Env.t}
  def update_pet(connection, pet, _opts \\ []) do
    request =
      %{}
      |> method(:put)
      |> url("/pet")
      |> add_param(:body, :body, pet)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PetStore.Model.Pet},
      {400, false},
      {404, false},
      {422, false},
      {:default, false}
    ])
  end

  @doc """
  Updates a pet in the store with form data.
  Updates a pet resource based on the form data.

  ### Parameters

  - `connection` (PetStore.Connection): Connection to server
  - `pet_id` (integer()): ID of pet that needs to be updated
  - `opts` (keyword): Optional parameters
    - `:name` (String.t): Name of pet that needs to be updated
    - `:status` (String.t): Status of pet that needs to be updated

  ### Returns

  - `{:ok, PetStore.Model.Pet.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec update_pet_with_form(Tesla.Env.client, integer(), keyword()) :: {:ok, nil} | {:ok, PetStore.Model.Pet.t} | {:error, Tesla.Env.t}
  def update_pet_with_form(connection, pet_id, opts \\ []) do
    optional_params = %{
      :name => :query,
      :status => :query
    }

    request =
      %{}
      |> method(:post)
      |> url("/pet/#{pet_id}")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PetStore.Model.Pet},
      {400, false},
      {:default, false}
    ])
  end

  @doc """
  Uploads an image.
  Upload image of the pet.

  ### Parameters

  - `connection` (PetStore.Connection): Connection to server
  - `pet_id` (integer()): ID of pet to update
  - `opts` (keyword): Optional parameters
    - `:additionalMetadata` (String.t): Additional Metadata
    - `:body` (String.t): 

  ### Returns

  - `{:ok, PetStore.Model.ApiResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec upload_file(Tesla.Env.client, integer(), keyword()) :: {:ok, nil} | {:ok, PetStore.Model.ApiResponse.t} | {:error, Tesla.Env.t}
  def upload_file(connection, pet_id, opts \\ []) do
    optional_params = %{
      :additionalMetadata => :query,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/pet/#{pet_id}/uploadImage")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, PetStore.Model.ApiResponse},
      {400, false},
      {404, false},
      {:default, false}
    ])
  end
end
