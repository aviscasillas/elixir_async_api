defmodule ElixirAsyncApi.Query.ResourcesProcessor do
  alias ElixirAsyncApi.Repo
  alias ElixirAsyncApi.Query.Resource

  def handle_messages(messages) do
    for %{key: _key, value: value} <- messages do
      resource = Poison.decode!(value, as: %Resource{})

      resource |> Repo.insert

      Absinthe.Subscription.publish(ElixirAsyncApiWeb.Endpoint, resource, [resource_created: true])
    end
    :ok
  end
end
