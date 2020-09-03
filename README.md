# ElixirAsyncApi

This is just a small prototype used as a playground to dive a bit into [Elixir](https://elixir-lang.org/), [Kafka](https://kafka.apache.org/), [GraphQL](https://graphql.org/) ([subscriptions](https://graphql.org/blog/subscriptions-in-graphql-and-relay/)) and [CQRS](https://medium.com/@danielckv/introduction-to-cqrs-in-microservices-70e4759d9ecc) pattern.

Bear in mind that this does not aim to teach anything, but is more like a self hands on to different technologies and concepts.

Checkout the diagram below for an overview on the basic architecture:
<img src="https://github.com/aviscasillas/elixir_async_api/blob/master/context_diagram.jpg">

> Note that both, API and kafka consumer, live within the same application (in favour of simplicity)

## Run it

```shell
# Clone this repo
https://github.com/aviscasillas/elixir_async_api.git

# Go to the root path of the project
cd elixir_async_api

# Install application dependencies
mix deps.get

# Startup Kafka and Postgres (wait for it to startup Postgres and Kafka)
docker-compose up &

# Setup the database
mix ecto.setup

# Run the application
mix phx.server

# Visit GraphiQL UI to play with it
open http://localhost:4000/api/graphiql
```

