defmodule Clashgarage do
  alias Clashgarage.Clashofclans.Queries

  def main() do
    choices()
  end

  def choices do
    IO.puts("Welcome to Clashgarage!")
    IO.puts("---------------------------")
    IO.puts("🧐 What would you like to do?")
    IO.puts("1. Add a new account")
    IO.puts("2. Show the stats of an account")
    IO.puts("3. Delete an account from the database")
    IO.puts("4. Refresh all accounts")
    IO.puts("5. Check if a tag is real")
    IO.puts("6. Return all the data from the database")

    case IO.gets("Enter your choice: ") |> String.trim() |> String.to_integer() do
      1 -> Queries.add_account_to_database()
      2 -> Queries.show_data_from_tag()
      3 -> Queries.delete_account_from_database()
      4 -> Queries.refresh_all_accounts()
      5 -> Queries.check_if_player_is_real_account()
      6 -> Queries.get_all_accounts()
      _ -> IO.puts("Invalid choice, please try again.")
    end
  end
end
