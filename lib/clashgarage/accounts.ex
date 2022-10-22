defmodule Clashgarage.ClashAccounts do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clash_of_clans" do
    field(:accountname, :string)
    field(:tag, :string)
    field(:townhall, :integer)

    timestamps()
  end

  def changeset(clash_of_clans, attrs) do
    clash_of_clans
    |> cast(attrs, [:accountname, :tag, :townhall])
    |> validate_required([:accountname, :tag])
    |> unique_constraint(:name, name: :clash_of_clans_tag_index, message: "Tag already saved!")
  end
end
