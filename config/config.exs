# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :platform,
  ecto_repos: [Platform.Repo]

# Configures the endpoint
config :platform, Platform.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TPmAt7nrr3uE61Q/qWm3ugb8A4jnuUfGW2zzkcnoMxrydEIHuqiVY1l6NSKD4Mkd",
  render_errors: [view: Platform.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Platform.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
