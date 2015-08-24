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


end
