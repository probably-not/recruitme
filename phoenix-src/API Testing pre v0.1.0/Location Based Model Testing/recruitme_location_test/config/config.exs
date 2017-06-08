# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :recruitme_location_test,
  ecto_repos: [RecruitmeLocationTest.Repo]

# Configures the endpoint
config :recruitme_location_test, RecruitmeLocationTest.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zi5L1hkrS+IuKeKOZDoYHEMP48HvnGQFlZgdkUk/rAS3fxNjwC8EzSS2ioSyOQAs",
  render_errors: [view: RecruitmeLocationTest.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RecruitmeLocationTest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
