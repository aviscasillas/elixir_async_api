defmodule ElixirAsyncApi.Query do
  alias ElixirAsyncApi.Repo
  alias ElixirAsyncApi.Query.Resource
  
  def list_resources do
    Resource |> Repo.all
  end
end
