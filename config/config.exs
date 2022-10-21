import Config

config :clashgarage,
      ecto_repos: [Clashgarage.Repo]

config :clashgarage, Clashgarage.Repo,
  database: System.get_env("DATABASE_DATABASE"),
  username: System.get_env("DATABASE_USERNAME"),
  password: System.get_env("DATABASE_PASSWORD"),
  hostname: System.get_env("DATABASE_HOSTNAME"),
  show_sensitive_data_on_connection_error: true
