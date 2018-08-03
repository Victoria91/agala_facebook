defmodule Agala.Provider.Facebook.Helpers.Users do
  @doc """
  Params:
  * `user_ids` - list of user id's
  * opts - keyword, which can have next params:
    * `fields` - string with additional fields, separated by comma
    * `name_case` - string with case of the returned name. Available values:
      * "nom"
      * "gen"
      * "dat"
      * "acc"
      * "ins"
      * "abl"
  """
  def get_user_info(user_id) do
    case HTTPoison.get(
           "https://graph.facebook.com/#{user_id}?fields=first_name,last_name&access_token=EAAEQidnOPiUBAGwKvVIL51wZAqfvtuPSTR2RrcarNM4yCFSOHJizogVU2HfFRsK3P6jA5vPLjI4amHhEu94SYnoieoL1RujSKq173TFLXxGmUXySG6ZCfGSQrSiZC6HIxg0cBGFKHhimYSSxA1UZAHQzSJjXyzfdeJSZCxnF9HgZDZD"
         ) do
      {:ok, %{body: body} = response} -> Jason.decode(body)
      error -> error
    end
  end
end
