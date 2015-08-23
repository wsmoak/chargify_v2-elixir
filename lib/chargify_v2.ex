defmodule ChargifyV2 do
  use Application
  use HTTPoison.Base

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      # worker(ChargifyV2.Worker, [arg1, arg2, arg3])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ChargifyV2.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @expected_fields ~w(
    call
  )

  def process_url(endpoint) do
    "https://" <> api_id <> ":" <> api_password <> "@api.chargify.com/api/v2" <> endpoint <> ".json"
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Dict.take(@expected_fields)
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end

  def api_id do
    Application.get_env(:chargify_v2, :api_id) ||
      System.get_env("CHARGIFY_DIRECT_API_ID")
  end

  def api_password do
    Application.get_env(:chargify_v2, :api_password) ||
      System.get_env("CHARGIFY_DIRECT_PASSWORD")
  end

end
