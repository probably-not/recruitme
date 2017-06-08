use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :recruitme_location_test, RecruitmeLocationTest.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :recruitme_location_test, RecruitmeLocationTest.Repo,
  adapter: Ecto.Adapters.Postgres,
  types: RecruitmeLocationTest.PostgresTypes,
  username: "postgres",
  password: "postgres",
  database: "recruitme_location_test_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox