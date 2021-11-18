defmodule HonestChatWeb.Live.Components.Messages do
  @moduledoc """
  Messages component
  """
  use HonestChatWeb, :live_component

  alias HonestChat.Rooms

  @impl true
  def update(%{room_id: nil} = _assigns, socket) do
    {:ok, assign(socket, room: nil, invite_link_copied: false)}
  end

  @impl true
  def update(%{room_id: room_id} = _assigns, socket) do
    {:ok, assign(socket, room: Rooms.get_room!(room_id))}
  end

  @impl true
  def render(%{room: nil} = assigns) do
    ~H"""
    <div class="w-full flex flex-col p-4">
      No room has been joined yet. To join a room click on its name on the sidebar to your left.
    </div>
    """
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="w-full flex flex-col">
      <!-- Top bar -->
      <div class="border-b flex px-6 py-2 items-center">
        <div class="flex flex-col">
          <h3 class="text-gray-800 text-md mb-1 font-extrabold">#<%= @room.name %></h3>
          <div class="text-gray-600 text-sm">
            <%= @room.description %>
          </div>
          <div class="text-gray-400 text-sm link">
            Invite code: <%= @room.invite_code %>
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 inline" fill="none"
                 viewBox="0 0 24 24" stroke="currentColor"
                 phx-click="copy_invite_code_link"
                 phx-value-code={@room.invite_code}
                 phx-target={@myself}>
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
            </svg>
            <%= if @invite_link_copied do %>
              copied <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
              </svg>
            <% end %>
          </div>
        </div>
      </div>
    </div>
    """
  end

  @impl true
  def handle_event("copy_invite_code_link", %{"code" => code}, socket) do
    base_url = HonestChatWeb.Endpoint.url()
    link = base_url <> Routes.live_path(socket, HonestChatWeb.Live.JoinRoomView, code)

    {:noreply, socket |> assign(invite_link_copied: true) |> push_event("copy_invite_code_link", %{link: link})}
  end
end

#
# <!-- Chat messages -->
# <div class="px-6 py-4 flex-1 overflow-scroll-x">
#   <!-- A message -->
#     <div class="flex items-start mb-4">
#       <img src="https://avatars2.githubusercontent.com/u/343407?s=460&v=4" class="w-10 h-10 rounded mr-3" />
#       <div class="flex flex-col">
#         <div class="flex items-end">
#           <span class="font-bold text-md mr-2 font-sans">killgt</span>
#           <span class="text-gray-500 text-xs font-400">11:46</span>
#         </div>
#         <p class="font-400 text-md text-gray-800 pt-1">The slack from the other side.</p>
#       </div>
#     </div>
#
#     <!-- A message -->
#     <div class="flex items-start mb-4">
#       <img src="https://i.imgur.com/8Km9tLL.jpg" class="w-10 h-10 rounded mr-3" />
#       <div class="flex flex-col">
#         <div class="flex items-end">
#           <span class="font-bold text-md mr-2 font-sans">Olivia Dunham</span>
#           <span class="text-gray-500 text-xs font-400">12:45</span>
#         </div>
#         <p class="font-400 text-md text-gray-800 pt-1">
#           How are we supposed to control the marquee space without an utility for it? I propose this:</p>
#           <div class="bg-gray-100 border border-gray-200 font-mono rounded p-3 mt-2 whitespace-pre">
#              .marquee-lightspeed { -webkit-marquee-speed: fast; }
# .marquee-lightspeeder { -webkit-marquee-speed: faster; }</div>
#       </div>
#     </div>
#
#     <!-- A message -->
#     <div class="flex items-start">
#       <img src="https://i.imgur.com/qACoKgY.jpg" class="w-10 h-10 rounded mr-3" />
#       <div class="flex flex-col">
#         <div class="flex items-end">
#           <span class="font-bold text-md mr-2 font-sans">Adam Bishop</span>
#           <span class="text-gray-500 text-xs font-400">12:46</span>
#         </div>
#         <p class="font-400 text-md text-gray-800 pt-1"><a href="#" class="text-blue-500">@Olivia Dunham</a> the
#              size of the generated CSS is creating a singularity in space/time, we must stop adding more utilities
#              before it's too late!</p>
#       </div>
#     </div>
#
#     <!-- Ignore -->
#     <br><br><br><br><br><br><br><br><br><br><br>
#   </div>
#
#   <div class="flex m-6 rounded-lg border-2 border-gray-500 overflow-hidden">
#     <span class="text-3xl text-gray-500 px-3 border-r-2 border-gray-500">+</span>
#     <input type="text" class="w-full px-4" placeholder="Message to #general"/>
#   </div>
