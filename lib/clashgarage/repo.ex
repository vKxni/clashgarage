defmodule Clashgarage.Repo do
  use Ecto.Repo,
    otp_app: :clashgarage,
    adapter: Ecto.Adapters.Postgres
end
