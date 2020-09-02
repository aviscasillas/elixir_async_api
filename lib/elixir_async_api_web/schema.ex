defmodule ElixirAsyncApiWeb.Schema do
  use Absinthe.Schema

  alias ElixirAsyncApiWeb.ResourcesResolver

  query do
    @desc "Get all resources"
    field :resources, list_of(:resource) do
      resolve &ResourcesResolver.list_resources/3
    end
  end
  
  mutation do
    @desc "Create a resource"
    field :create_resource, type: :resource do
      arg :name, non_null(:string)
      resolve &ResourcesResolver.create_resource/3
    end
  end

  subscription do
    field :resource_created, :resource do
      config fn _, _ ->
        {:ok, topic: true}
      end

      trigger :create_resource, topic: fn _ ->
        true
      end

      resolve fn resource, _, _ ->
        {:ok, resource}
      end
    end
  end

  object :resource do
    field :id, :id
    field :name, :string
  end
end
