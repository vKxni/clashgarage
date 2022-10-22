defmodule Clashgarage.ClashAccounts do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clash_of_clans" do
    field(:accountname, :string)
    field(:tag, :string)
    field(:townhall, :integer)

    timestamps()
  end

  def changeset(clash_accounts, attrs) do
    clash_accounts
    |> cast(attrs, [:accountname, :tag, :townhall])
    |> validate_required([:accountname, :tag, :townhall])
    |> unique_constraint(:tag,
      name: :users_account_tag_index,
      message: "USER_EXISTS_WITH_SAME_TAG"
    )
  end
end
