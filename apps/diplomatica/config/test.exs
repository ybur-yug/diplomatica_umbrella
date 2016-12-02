use Mix.Config

# Configure your database
config :diplomatica, Diplomatica.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "diplomatica_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
