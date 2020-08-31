defmodule ElixirAsyncApiWeb.Resolver do
  require Logger

  def list_resources(_parent, _args, _resolution) do
    {:ok, ElixirAsyncApi.list_resources}
  end

  def create_resource(_parent, %{name: name}, _resolution) do
    Logger.info("Creating resource: #{name}")
    case ElixirAsyncApi.create_resource(name) do
      :ok -> {:ok, %{status: :sent}}
    end
  end
end
