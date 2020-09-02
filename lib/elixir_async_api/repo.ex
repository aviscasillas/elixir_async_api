defmodule ElixirAsyncApi.Repo do
  use Ecto.Repo,
    otp_app: :elixir_async_api,
    adapter: Ecto.Adapters.Postgres
end
