defmodule Clashgarage.Clashofclans.Queries do
  alias Clashgarage.ClashofClansClient
  require Ecto.Query

  @moduledoc """
  This module contains all the queries for the ClashofClansClient
  - fetch player
  - show data
  - validate data
  - insert data
  - update data
  - delete data
  - show data
  """

  def get_player_from_user do
    tag =
      IO.gets("Enter your player tag: ")
      |> String.trim()

    ClashofClansClient.fetch_data(tag)
  end

  @doc """
  Adds the given account to the database
  """
  def add_account_to_database do
    account = check_if_player_is_valid()

    data = %Clashgarage.ClashAccounts{
      accountname: account["name"],
      tag: account["tag"],
      townhall: account["townHallLevel"]
    }

    Clashgarage.Repo.insert(data)
  end

  @doc """
  Utility function to check if the given tag is a valid player
  """
  def check_if_player_is_valid do
    with {:ok, account} <- get_player_from_user() do
      if account["reason"] == "notFound" do
        IO.puts("❌ | I was unable to find that account, please try again.")
        check_if_player_is_valid()
      else
        IO.puts("✅ | Account found! Showing data ...")
        Map.take(account, ["name", "tag", "townHallLevel"])
      end
    end
  end

  @doc """
  Utility function to check if the given tag is within the database
  """
  def check_if_tag_exists do
    tag =
      IO.gets("Enter your player tag: ")
      |> String.trim()

    Clashgarage.Repo.get_by(Clashgarage.ClashAccounts, tag: tag)
  end

  @doc """
  Loop through all accounts and update them
  """
  def refresh_all_accounts do
    Clashgarage.Repo.all(Clashgarage.ClashAccounts)
    |> Enum.map(fn account ->
      ClashofClansClient.fetch_data(account.tag)
    end)
  end

  @doc """
  Returns the whole data of the account
  """
  def show_data_from_tag do
    get_player_from_user()
  end

  def delete_account_from_database do
    account = check_if_tag_exists()

    if account == nil do
      IO.puts("❌ | I was unable to find that account, please try again.")
      delete_account_from_database()
    else
      IO.puts("✅ | Account found! Deleting ...")
      Clashgarage.Repo.delete(account)
    end
  end

  @doc """
  Utility functions for debugging and showing data from the database
  """
  def get_all_accounts do
    Clashgarage.Repo.all(Clashgarage.ClashAccounts)
  end

  def get_account_by_tag() do
    tag =
      IO.gets("Enter your player tag: ")
      |> String.trim()
    with {:ok, account} <-  Clashgarage.Repo.get_by(Clashgarage.ClashAccounts, tag: tag) do
      if account == nil do
        IO.puts("❌ | I was unable to find that account, please try again.")
        get_account_by_tag()
      else
        IO.puts("✅ | Account found! Showing data ...")
        Map.take(account, ["name", "tag", "townHallLevel"])
      end
    end
  end

  def check_if_player_is_real_account do
    with {:ok, account} <- get_player_from_user() do
      if account["reason"] == "notFound" do
        IO.puts("❌ | The given tag is not valid, banned or another type of tag.")
        check_if_player_is_real_account()
      else
        IO.puts("✅ | Account exists!")
      end
    end
  end

  @doc """
  Use this visely, this will completely erase everything from the database
  """
  def purge_data do
    choice = IO.gets("Are you sure you want to delete everything? (y/n): ")

    case choice do
      "y" -> Clashgarage.Repo.delete_all(Clashgarage.ClashAccounts)
      "n" -> IO.puts("Aborting ...")
      _ -> IO.puts("Invalid choice, please try again.")
    end
  end
end
