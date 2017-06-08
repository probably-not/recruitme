use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :recruitme_api, RecruitmeApi.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :recruitme_api, RecruitmeApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  types: RecruitmeApi.PostgresTypes,
  username: "postgres",
  password: "postgres",
  database: "recruitme_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
