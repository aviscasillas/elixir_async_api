defmodule ElixirAsyncApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ElixirAsyncApi.Repo,
      # Start the Telemetry supervisor
      ElixirAsyncApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, [name: ElixirAsyncApi.PubSub, adapter: Phoenix.PubSub.PG2]},
      # Start the Endpoint (http/https)
      ElixirAsyncApiWeb.Endpoint,
      # Start a worker by calling: ElixirAsyncApi.Worker.start_link(arg)
      # {ElixirAsyncApi.Worker, arg}
      {Absinthe.Subscription, ElixirAsyncApiWeb.Endpoint}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirAsyncApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ElixirAsyncApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
