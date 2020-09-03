defmodule ElixirAsyncApi.Query.Resource do
  use Ecto.Schema

  @primary_key {:id, :string, []}

  schema "resources" do
    field :name, :string
  end
end
