defmodule Clashgarage.ClashofClansClient do
  alias Clashgarage.ApiBase

  @type player_tag :: String.t()
  @spec fetch_data(player_tag()) :: {:ok, map()} | {:error, String.t()}
  def fetch_data(tag) do
    url = "https://api.clashofclans.com/v1/players/#{URI.encode_www_form(tag)}"

    with {:ok, %{body: body}} <- ApiBase.get(url) do
      Jason.decode(body)
    end
  end
end
