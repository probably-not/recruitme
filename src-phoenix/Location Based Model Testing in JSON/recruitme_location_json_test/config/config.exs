# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :recruitme_location_json_test,
  ecto_repos: [RecruitmeLocationJsonTest.Repo]

# Configures the endpoint
config :recruitme_location_json_test, RecruitmeLocationJsonTest.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "n8igqi4GXjJo70jgePUfJ8RdHV6EXjuZqonbBmT2ST/QxrXZm4uayoYIUifAqynG",
  render_errors: [view: RecruitmeLocationJsonTest.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RecruitmeLocationJsonTest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
