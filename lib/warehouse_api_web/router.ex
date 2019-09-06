defmodule WarehouseApiWeb.Router do
  use WarehouseApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug WarehouseApiWeb.ApiAuthPlug, otp_app: :warehouse_api
  end

  pipeline :api_protected do
    plug Pow.Plug.RequireAuthenticated, error_handler: WarehouseApiWeb.ApiAuthErrorHandler
  end

  scope "/api", WarehouseApiWeb do
    pipe_through :api

    resources "/registration", RegistrationController, singleton: true, only: [:create]
    resources "/session", SessionController, singleton: true, only: [:create, :delete]
    post "/session/renew", SessionController, :renew
  end

  scope "/api", WarehouseApiWeb do
    pipe_through :api
    resources "/products", ProductController, only: [:show, :index]
  end

  scope "/api", WarehouseApiWeb do
    pipe_through [:api, :api_protected]
    resources "/products", ProductController, except: [:new, :edit, :show, :index]
  end
end
