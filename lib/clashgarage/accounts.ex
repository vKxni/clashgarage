defmodule Clashgarage.Accounts do
  use Ecto.Schema

  schema "accounts" do
    field :name, :string
    field :tag, :string
    field :townhall, :integer
    field :arena, :integer
    timestamps()
  end
end
