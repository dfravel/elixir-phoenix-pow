defmodule WarehouseApi.Repo do
  use Ecto.Repo,
    otp_app: :warehouse_api,
    adapter: Ecto.Adapters.Postgres
end
