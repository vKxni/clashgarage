defmodule Clashgarage.Repo.Migrations.Accounts do
  use Ecto.Migration

  def change do
    create table(:clash_of_clans) do
      add :name, :string
      add :tag, :string
      add :townhall, :integer
      timestamps()
    end

    create table(:clash_royale) do
      add :name, :string
      add :tag, :string
      add :arena, :integer
      timestamps()
    end
  end
end
