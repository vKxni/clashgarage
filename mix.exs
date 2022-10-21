defmodule Clashgarage.MixProject do
  use Mix.Project

  @github_url "https://github.com/vKxni/clashgarage"

  def project do
    [
      app: :clashgarage,
      description: "A parking lot for some stuff around the SC APis",
      version: "1.0.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      repo: @github_url,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Clashgarage.Application, []}
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:poison, "~> 5.0"},
      {:dotenv_parser, "~> 2.0"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"}
    ]
  end
end
