defmodule ElixirAsyncApiWeb.Schema do
  use Absinthe.Schema
  import_types ElixirAsyncApiWeb.Schema.Types

  alias ElixirAsyncApiWeb.Resolver

  query do
    @desc "Get resources"
    field :resources, list_of(:resource) do
      resolve &Resolver.list_resources/3
    end
  end
end
