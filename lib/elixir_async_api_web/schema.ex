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

  mutation do
    @desc "Create a resource"
    field :create_resource, type: :mutation_response do
      arg :name, non_null(:string)
      resolve &Resolver.create_resource/3
    end
  end
end
