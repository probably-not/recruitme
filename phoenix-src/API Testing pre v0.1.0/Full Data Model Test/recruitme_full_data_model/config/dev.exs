use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :recruitme_full_data_model, RecruitmeFullDataModel.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []


# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :recruitme_full_data_model, RecruitmeFullDataModel.Repo,
  adapter: Ecto.Adapters.Postgres,
  types: RecruitmeFullDataModel.PostgresTypes,
  username: "postgres",
  password: "postgres",
  database: "recruitme_full_data_model_dev",
  hostname: "localhost",
  pool_size: 10
