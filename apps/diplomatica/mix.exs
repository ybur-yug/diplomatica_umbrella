defmodule Diplomatica.Mixfile do
  use Mix.Project

  def project do
    [
     app: :diplomatica,
     version: "0.0.1",
     build_path: "../../_build",
     config_path: "../../config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()
    ]
  end

  def application do
    [applications: [:logger, :postgrex, :ecto],
     mod: {Diplomatica, []}]
  end

  defp deps do
    [
     {:postgrex, ">= 0.0.0"},
     {:ecto, "~> 2.1-rc"}
    ]
  end

  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
