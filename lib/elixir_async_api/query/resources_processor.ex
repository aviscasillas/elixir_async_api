defmodule ElixirAsyncApi.Query.ResourcesProcessor do
  alias ElixirAsyncApi.Repo
  alias ElixirAsyncApi.Query.Resource

  def handle_messages(messages) do
    for %{key: _key, value: value} <- messages do
      Poison.decode!(value, as: %Resource{})
      |> Repo.insert
    end
    :ok
  end
end
