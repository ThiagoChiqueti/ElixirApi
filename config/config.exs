# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :real_deal_api,
  ecto_repos: [RealDealApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :real_deal_api, RealDealApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VB0at8Dvn+EHcjrLS88AV33YK6kQuXYTAl0BM27GvliFe2wj6Jc1nkcZIGBQLvJr",
  render_errors: [view: RealDealApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: RealDealApi.PubSub,
  live_view: [signing_salt: "9I5Q01ux"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :real_deal_api, RealDealApiWeb.Auth.Guardian,
  issuer: "real-deal-api",
  secret_key: "nqx+rGG3EuMwZk2Vs/wUgTHTflO1xtfadLAPeJL55XuVkPGmH6kw2eGL2YdORyxl"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :guardian, Guardian.DB,
  repo: RealDealApi.Repo,
  schema_name: "guardian_tokens", #schema do banco de dados /nome da tabela
  sweep_interval: 60  #tempo que o banco de dados deixa o token salvo, caso o token não esteja no banco de dados ele é automaticamente inválido

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
