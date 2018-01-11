defmodule Cardserver.Router do
  require Logger
  use Cardserver.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Cardserver do
    Logger.info "Logger exist!!!"
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/cards", CardsController, except: [:new, :edit]

  end

  # Other scopes may use custom stacks.
  scope "/api", Cardserver do
    pipe_through :api
    resources "/addwords", WordsController
  end
end
