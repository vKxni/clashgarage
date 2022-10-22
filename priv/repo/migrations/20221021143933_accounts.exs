defmodule Clashgarage.Repo.Migrations.Accounts do
  use Ecto.Migration

  def change do
    create table(:clash_of_clans) do
      add :accountname, :string
      add :tag, :string
      add :townhall, :integer
      timestamps()
    end
    create unique_index("clash_of_clans", [:tag])
  end
end
