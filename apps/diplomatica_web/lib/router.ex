defmodule Diplomatica.Web.Router do
  use Diplomatica.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug UaPlug
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :role_authentication do
    plug Diplomat.Plug.LoadResource, resource_loader: Diplomatica.Web.UserLoader
    plug Diplomat.Plug.EnsurePermitted, policy: Diplomatica.Web.UserPolicy
  end

  scope "/", Diplomatica.Web do
    pipe_through [:browser, :browser_session, :role_authentication]

    get       "/",       PageController,    :index

    get       "/login",  SessionController, :new,    as: :login
    post      "/login",  SessionController, :create, as: :login
    delete    "/logout", SessionController, :delete, as: :logout
    get       "/logout", SessionController, :delete, as: :logout

    resources "/cats",   CatController
    resources "/users",  UserController
  end
end
