defmodule HonestChatWeb.Live.IndexView do
  @moduledoc """
  Chat app index live view
  """
  use HonestChatWeb, :live_view

  alias HonestChatWeb.Live.Components

  @impl true
  def mount(_params, _session, socket) do
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
        <.live_component module={Components.Sidebar} id="sidebar" current_user={@current_user} />
        <.live_component module={Components.Messages} id="messages" room_id={@current_room_id} />
      </div>
    </div>
    """
  end

  # <.live_component module={Components.Modal} id="add-room" />

  @impl true
  def handle_event("enter-room", %{"id" => room_id} = _event, socket) do
    IO.inspect("Will enter room #{room_id}")
    {:noreply, assign(socket, current_room_id: room_id)}
  end
end
