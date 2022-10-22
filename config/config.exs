import Config

config :clashgarage,
  ecto_repos: [Clashgarage.Repo]

config :clashgarage, Clashgarage.Repo,
  database: "",
  username: "",
  password: "",
  hostname: "",
  api_key: System.get_env("API_KEY"),
  show_sensitive_data_on_connection_error: false

  # or just use .env files (after that, run: source .env in your terminal)
  # database: System.get_env("DATABASE"),
  # username: System.get_env("USERNAME"),
  # password: System.get_env("PASSWORD"),
  # hostname: System.get_env("HOSTNAME"),
