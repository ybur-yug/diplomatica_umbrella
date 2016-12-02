use Mix.Config

# Configure your database
config :diplomatica, Diplomatica.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "diplomatica_dev",
  hostname: "localhost",
  pool_size: 10
