defmodule Clashgarage.ApiBase do
  use HTTPoison.Base

  @moduledoc """
  This handles the APi requests to the APi, requires authentication (APi key)
  """

  def process_request_headers(headers),
    do: headers ++ [Authorization: "Bearer #{api_key()}", Accept: "application/json"]

  defp api_key(),
    do:
      "api key here or" # Application.get_env(:clashgarage, :api_key)
end
