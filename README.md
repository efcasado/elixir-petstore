# PetStore

This is a sample Pet Store Server based on the OpenAPI 3.0 specification.  You can find out more about Swagger at [https://swagger.io](https://swagger.io). In the third iteration of the pet store, we&#39;ve switched to the design first approach! You can now help us improve the API whether it&#39;s by making changes to the definition itself or to the code. That way, with time, we can improve the API in general, and expose some of the new features in OAS3.  Some useful links: - [The Pet Store repository](https://github.com/swagger-api/swagger-petstore) - [The source API definition for the Pet Store](https://github.com/swagger-api/swagger-petstore/blob/master/src/main/resources/openapi.yaml)

## Building

To install the required dependencies and to build the elixir project, run:

```console
mix local.hex --force
mix do deps.get, compile
```

## Installation

If [available in Hex][], the package can be installed by adding `elixir_petstore` to
your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:elixir_petstore, "~> 1.0.0"}]
end
```

Documentation can be generated with [ExDoc][] and published on [HexDocs][]. Once published, the docs can be found at
[https://hexdocs.pm/elixir_petstore][docs].

## Configuration

You can override the URL of your server (e.g. if you have a separate development and production server in your
configuration files).

```elixir
config :elixir_petstore, base_url: "https://petstore3.swagger.io/api/v3"
```

Multiple clients for the same API with different URLs can be created passing different `base_url`s when calling
`PetStore.Connection.new/1`:

```elixir
client = PetStore.Connection.new(base_url: "https://petstore3.swagger.io/api/v3")
```

[exdoc]: https://github.com/elixir-lang/ex_doc
[hexdocs]: https://hexdocs.pm
[available in hex]: https://hex.pm/docs/publish
[docs]: https://hexdocs.pm/elixir_petstore
