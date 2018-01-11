# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cardserver,
  ecto_repos: [Cardserver.Repo]

# Configures the endpoint
config :cardserver, Cardserver.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "52QpMcWd3HHN20muZhPGYHmcOu2k91fbGjZ92TmTvvWlLCCBsqP9oJh5q7xqmAXW",
  render_errors: [view: Cardserver.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cardserver.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
