defmodule ElixirAsyncApiWeb.ResourcesResolver do
  alias ElixirAsyncApi.Query
  alias ElixirAsyncApi.Command

  def list_resources(_parent, _args, _resolution) do
    {:ok, Query.list_resources}
  end
  
  def create_resource(_parent, %{name: name}, _resolution) do
    {:ok, _resource} = Command.create_resource(name)
  end
end
