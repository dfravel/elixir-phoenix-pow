use Mix.Config

# Configure your database
config :warehouse_api, WarehouseApi.Repo,
  username: "postgres",
  password: "postgres",
  database: "warehouse_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :warehouse_api, WarehouseApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
