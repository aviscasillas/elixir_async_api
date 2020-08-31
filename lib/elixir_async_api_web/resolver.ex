defmodule ElixirAsyncApiWeb.Resolver do
  def list_resources(_parent, _args, _resolution) do
    {:ok, ElixirAsyncApi.list_resources}
  end
end
