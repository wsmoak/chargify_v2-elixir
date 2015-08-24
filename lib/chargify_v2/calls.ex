defmodule ChargifyV2.Calls do
  @moduledoc """
  Calls for Chargify API V2.
  """

  @doc """
  Retrieve the record of a Chargify Direct Call
  """
  def read(call_id) do
    ChargifyV2.get("/calls/#{call_id}")
  end

  @doc """
  Retrieve the record of a Chargify Direct Call
  """
  def read!(call_id) do
    ChargifyV2.get!("/calls/#{call_id}")
  end

  @doc """
  Returns a list of maps, each map containing the keys attribute and message
  """
  def errors(response) do
    response.body[:call]["response"]["result"]["errors"]
  end

  @doc """
  Returns a list of strings
  """
  def error_messages(response) do
    response
    |> errors
    |> Enum.map( &Dict.fetch!(&1, "message") )
  end
end
