defmodule HonestChatWeb.Live.IndexView do
  @moduledoc """
  Chat app index live view
  """
  use HonestChatWeb, :live_view

  alias HonestChatWeb.Live.Components

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do:
      Phoenix.PubSub.subscribe(HonestChat.PubSub, "rooms")
    {:ok, assign(socket, current_room_id: nil)}
  end

  @impl true
  def handle_params(_params, _url, socket) do
    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="w-full border shadow bg-white">
      <div class="flex">
        <.live_component module={Components.Sidebar} id="sidebar" current_user={@current_user} current_room_id={@current_room_id} />
        <.live_component module={Components.Messages} id="messages" current_user={@current_user}  room_id={@current_room_id} />
      </div>
    </div>
    """
  end

  # <.live_component module={Components.Modal} id="add-room" />

  @impl true
  def handle_event("enter-room", %{"id" => room_id} = _event, socket) do
    {:noreply, assign(socket, current_room_id: room_id)}
  end

  @impl true
  def handle_info({:message, room_id, message}, socket) do
    current_room = socket.assigns.current_room_id
    if current_room && room_id == String.to_integer(current_room) do
      send_update(Components.Messages, id: "messages", new_message: message)
    end
    {:noreply, socket}
  end
end
