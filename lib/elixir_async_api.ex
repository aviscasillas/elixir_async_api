defmodule ElixirAsyncApi do
  @moduledoc """
  ElixirAsyncApi keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  require Logger

  def list_resources do
    [
      %{id: 1, name: "First"},
      %{id: 2, name: "Second"},
      %{id: 3, name: "Third"},
    ]
  end

  def create_resource(name) do
    Kaffe.Producer.produce_sync("resources", UUID.uuid1(), name)
  end
end
