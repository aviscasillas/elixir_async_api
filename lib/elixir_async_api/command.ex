defmodule ElixirAsyncApi.Command do
  alias ElixirAsyncApi.Command.ResourcesProducer

  def create_resource(name) do
    resource = %{id: UUID.uuid1(), name: name}

    case ResourcesProducer.produce(resource) do
      :ok -> {:ok, resource}
    end
  end
end
