# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :warehouse_api,
  ecto_repos: [WarehouseApi.Repo]

# Configures the endpoint
config :warehouse_api, WarehouseApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SXCd2jFhd+viI9Sq1Nn63REDsH1DhzEDF3zyymz/4/fId9ohfL6rr+5mdLfKloyp",
  render_errors: [view: WarehouseApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: WarehouseApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Pow configuration
config :warehouse_api, :pow,
  user: WarehouseApi.Users.User,
  repo: WarehouseApi.Repo

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
