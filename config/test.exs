import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :vega, VegaWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "7kAoIXtjnH+ZVtLsCL0wrqvwJQJfTEA7Qpq3Rw+vA9OCy2m50w0qiFO9yrl/6mKr",
  server: false

# In test we don't send emails.
config :vega, Vega.Mailer,
  adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
