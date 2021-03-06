# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :diplomatica_web,
  ecto_repos: []

# Configures the endpoint
config :diplomatica_web, Diplomatica.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QzS4drgNtEmuPAEuIVJmPXDxOF6ngsTt04iJMkdj+4pCk7pPU6M9r5Z0Hp1rpbZ2",
  render_errors: [view: Diplomatica.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Diplomatica.Web.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Diplomatica.Web",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: "SOME_KEY",
  serializer: Diplomatica.Web.GuardianSerializer

config :diplomat,
  handler: RoleAuth.Handlers.ErrorHandler
