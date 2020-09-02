defmodule ElixirAsyncApi do
  alias ElixirAsyncApi.Repo
  alias ElixirAsyncApi.Resource

  @moduledoc """
  ElixirAsyncApi keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def list_resources do
    Resource |> Repo.all
  end

  def create_resource(name) do
    resource = %{id: UUID.uuid1(), name: name}
    case Kaffe.Producer.produce_sync("resources", resource.id, Poison.encode!(resource)) do
      :ok -> {:ok, resource}
    end
  end
end
