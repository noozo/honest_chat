defmodule HonestChat.Rooms do
  @moduledoc """
  The Rooms context.
  """

  import Ecto.Query, warn: false
  alias HonestChat.Repo

  alias HonestChat.Rooms.Room

  def get_user_rooms(user_id) when is_integer(user_id) do
    Repo.all(from r in Room, where: r.user_id == ^user_id)
  end

  def get_room!(id) do
    Repo.get!(Room, id)
  end

  def create_room(attrs) when is_map(attrs) do
    %Room{}
    |> Room.changeset(attrs)
    |> Repo.insert()
  end
end
