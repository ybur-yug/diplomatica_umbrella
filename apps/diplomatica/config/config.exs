use Mix.Config

config :diplomatica, ecto_repos: [Diplomatica.Repo]



import_config "#{Mix.env}.exs"
