# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :liveview_github, LiveviewGithubWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aKxb/t9k0A9/36Zz5aqVrp2wfBeWpnFVWlOu5UrLDYBF70DBPMHBXWDPgSfcz3Yy",
  render_errors: [view: LiveviewGithubWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiveviewGithub.PubSub,
  live_view: [signing_salt: "xwR9Rvxx"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
