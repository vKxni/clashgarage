[![Discord](https://img.shields.io/discord/823720615965622323.svg?style=for-the-badge)](https://discord.gg/UDNcTrBagN)
[![Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/vkxni)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)](https://github.com/alelievr/Mixture/blob/master/LICENSE)

# <p align="center">Clashgarage

<p align="center">A <strong>CLI-like</strong> Application around the SuperCell APis.</p>

<p align="center">
<img src="clashgarage.png?width=690&height=590"  alt="clashgarage" width="200" height="200"/></a>
<p>

## Functions

> Raw
- `get_player_from_user` Get the tag of the user
- `add_account_to_database` Add an account to the database
- `check_if_player_is_valid` Check if the player is valid
- `check_if_tag_exists` Check if the tag exists in the database
- `refresh_all_accounts` Update all accounts in the database
- `show_data_from_tag` Return a map with all the data 
- `delete_account_from_database` Delete an account from the database
- `get_all_accounts` Get all accounts from the database
- `get_account_by_tag` Get an account by tag
- `check_if_player_is_real_account` Check if an account exists
- `purge_data` Delete all data from the database

> Formatted
- `Queries.add_account_to_database()`
- `Queries.show_data_from_tag()`
- `Queries.delete_account_from_database()`
- `Queries.refresh_all_accounts()`
- `Queries.check_if_player_is_real_account()`
- `Queries.get_all_accounts()`

### Self-hosting

> Requirements
- [Elixir 1.14](https://elixir-lang.org/)
- OTP 24
- PostgreSQL 14.5+
- [APi Key](https://developer.clashofclans.com/#/)


> Installation
```
$ git clone https://github.com/vKxni/clashgarage.git
$ cd clashgarage

$ mix deps.get
```
- Fill out the database credentials in `config/config.exs`

- Enter the APi key in `lib/utils/api.ex`
``` 
$ mix ecto.create
$ mix ecto.migrate

$ iex -S mix

$ Clashgarage.main()
``` 

