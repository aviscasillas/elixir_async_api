# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixir_async_api,
  ecto_repos: [ElixirAsyncApi.Repo]

# Configures the endpoint
config :elixir_async_api, ElixirAsyncApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YgxPic4LdB2xIFURMibjBSkB23LdoSXi+E4bn0JJS4Ibs2nMW+LYO9MFi6BzKRTv",
  render_errors: [view: ElixirAsyncApiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElixirAsyncApi.PubSub,
  live_view: [signing_salt: "XygbwR52"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :kaffe,
  producer: [
    endpoints: [localhost: 9092],
    topics: ["resources"],
    partition_strategy: :md5
  ],
  consumer: [
    endpoints: [localhost: 9092],
    topics: ["resources"],
    consumer_group: "elixir_async_api",
    message_handler: ElixirAsyncApi.Query.ResourcesProcessor,
    start_with_earliest_message: true
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
