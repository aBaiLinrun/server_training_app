defmodule Myapp do
  @moduledoc """
  Documentation for Myapp.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Myapp.hello
      :world

  """
  def hello do
    :world
  end

  alias Hipchat.ApiClient
  alias Hipchat.Httpc.Response
  alias Hipchat.V2.Rooms

  def main([room_id, msg]) do
    IO.puts("\nHello Cosmos, from elixir MyApp!\n")
    '''
    client = ApiClient.new(load_chat_token())
    {
      {:ok, %Response{status: 201}} = Rooms.send_message(client, room_id, %{message: msg})
    }
    '''
    client = ApiClient.new(load_view_token())
    {
      {:ok, %Response{status: 201}} = Rooms.get_recent_room_history(client, room_id, "reverse")
    }
  end

  defp load_chat_token() do
    Path.expand("~/.config/hipchat_cli/chat_token")
    |> File.read!()
    |> String.trim()
  end

  defp load_view_token() do
    Path.expand("~/.config/hipchat_cli/view_token")
    |> File.read!()
    |> String.trim()
  end

end
