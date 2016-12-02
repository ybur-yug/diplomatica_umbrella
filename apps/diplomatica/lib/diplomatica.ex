defmodule Diplomatica do
  @moduledoc """
  The Diplomatica Application Service.

  The diplomatica system business domain lives in this application.

  Exposes API to clients such as the `Diplomatica.Web` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      worker(Diplomatica.Repo, []),
    ], strategy: :one_for_one, name: Diplomatica.Supervisor)
  end
end
