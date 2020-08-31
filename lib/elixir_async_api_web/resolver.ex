defmodule ElixirAsyncApiWeb.Resolver do
  def list_resources(_parent, _args, _resolution) do
    {:ok, ElixirAsyncApi.list_resources}
  end

  def create_resource(_parent, args, _resolution) do
    ElixirAsyncApi.create_resource(args)
    {:ok, %{status: :sent}}
  end
end
