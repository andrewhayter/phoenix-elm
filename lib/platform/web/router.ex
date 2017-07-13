defmodule Platform.Web.Router do
  use Platform.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Platform.Web.PlayersAuthController, repo: Platform.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Platform.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PlayersController, :new
    get "/elm", PageController, :index
    resources "/players", PlayersController
    resources "/sessions", PlayersSessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Platform.Web do
  #   pipe_through :api
  # end
end
