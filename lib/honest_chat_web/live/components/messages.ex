defmodule HonestChatWeb.Live.Components.Messages do
  @moduledoc """
  Messages component
  """
  use HonestChatWeb, :live_component

  @impl true
  def update(_assigns, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="w-full flex flex-col">
    </div>
    """
  end
end

#   <!-- Top bar -->
#   <div class="border-b flex px-6 py-2 items-center">
#     <div class="flex flex-col">
#       <h3 class="text-gray-800 text-md mb-1 font-extrabold">#general</h3>
#       <div class="text-gray-500 font-thin text-sm">
#         Chit-chattin' about ugly HTML and mixing of concerns.
#       </div>
#     </div>
# </div>
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
