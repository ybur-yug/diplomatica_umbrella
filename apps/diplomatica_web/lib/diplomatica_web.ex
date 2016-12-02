defmodule Diplomatica.Web do
  @moduledoc """
  The Web application for `Diplomatica`

  This module can be used in your application to import common
  controller, view, and channel functionality, for example:

      use Diplomatica.Web, :controller
      use Diplomatica.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the endpoint when the application starts
      supervisor(Diplomatica.Web.Endpoint, []),
      # Start your own worker by calling: Diplomatica.Web.Worker.start_link(arg1, arg2, arg3)
      # worker(Diplomatica.Web.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Diplomatica.Web.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Diplomatica.Web.Endpoint.config_change(changed, removed)
    :ok
  end



  def schema do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
    end
  end

  def controller do
    quote do
      use Phoenix.Controller, namespace: Diplomatica.Web
      import Diplomatica.Web.Router.Helpers
      import Diplomatica.Web.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/templates",
                        namespace: Diplomatica.Web

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import Diplomatica.Web.Router.Helpers
      import Diplomatica.Web.ErrorHelpers
      import Diplomatica.Web.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import Diplomatica.Web.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
