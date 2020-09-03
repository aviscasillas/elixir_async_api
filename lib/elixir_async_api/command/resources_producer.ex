defmodule ElixirAsyncApi.Command.ResourcesProducer do
  def produce(resource) do
    Kaffe.Producer.produce_sync("resources", resource.id, Poison.encode!(resource))
  end
end
