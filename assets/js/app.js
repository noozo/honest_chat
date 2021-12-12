// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "./vendor/some-package.js"
//
// Alternatively, you can `npm install some-package` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import { Socket } from "phoenix"
import { LiveSocket } from "phoenix_live_view"
import topbar from "../vendor/topbar"
import * as storage from "./storage"

let Hooks = {}
Hooks.LoadMessagesFromLocalStorage = {
  mounted() {
    window.addEventListener(`phx:load_messages`, (e) => {
      const room_id = e.detail.room_id
      this.pushEventTo("#messages", "load-messages", storage.load_messages(room_id))
    })
  }
}

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, { params: { _csrf_token: csrfToken }, hooks: Hooks })

// storage.clear_messages(1)
// storage.clear_messages(6)

// Show progress bar on live navigation and form submits
topbar.config({ barColors: { 0: "#29d" }, shadowColor: "rgba(0, 0, 0, .3)" })
window.addEventListener("phx:page-loading-start", info => topbar.show())
window.addEventListener("phx:page-loading-stop", info => topbar.hide())

window.addEventListener(`phx:copy_invite_code_link`, (e) => {
  navigator.clipboard.writeText(e.detail.link);
})



window.addEventListener(`phx:new_message`, (e) => {
  // Store e.detail.message in local storage
  let room_messages = storage.load_messages(e.detail.room_id) || []
  room_messages.push(e.detail.message)
  storage.save_messages(e.detail.room_id, room_messages)
})

window.addEventListener(`phx:clear_input`, (e) => {
  // Clear input after sending message
  document.getElementById(e.detail.field_id).value = ''
})

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket
