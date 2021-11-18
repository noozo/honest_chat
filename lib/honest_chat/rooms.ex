defmodule HonestChat.Rooms do
  @moduledoc """
  The Rooms context.
  """
  import Ecto.Query, warn: false
  import Ecto.Changeset

  alias HonestChat.Accounts
  alias HonestChat.Accounts.User
  alias HonestChat.Repo
  alias HonestChat.Rooms.Room

  def get_user_rooms(%User{} = user) do
    user
    |> Repo.preload(:rooms)
    |> Map.get(:rooms)
  end

  def get_room!(id) do
    Repo.get!(Room, id)
  end

  def get_room_by!(opts) do
    Repo.get_by!(Room, opts)
  end

  def join(user, room) do
    room = Repo.preload(room, :members)

    room
    |> Room.changeset(%{})
    |> put_assoc(:members, [user | room.members])
    |> Repo.update()
  end

  def create_room(attrs) when is_map(attrs) do
    user = Accounts.get_user!(attrs.user_id)

    %Room{}
    |> Room.changeset(attrs)
    |> put_assoc(:members, [user])
    |> Repo.insert()
  end
end
