use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :recruitme_full_data_model, RecruitmeFullDataModel.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :recruitme_full_data_model, RecruitmeFullDataModel.Repo,
  adapter: Ecto.Adapters.Postgres,
  types: RecruitmeFullDataModel.PostgresTypes,
  username: "postgres",
  password: "postgres",
  database: "recruitme_full_data_model_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
