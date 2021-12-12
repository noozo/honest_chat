export function hello() {
  console.log("world")
}

export function save_messages(room_id, messages) {
  const storage = window["localStorage"]
  storage.setItem("messages:" + room_id, JSON.stringify(messages))
}

export function load_messages(room_id) {
  const storage = window["localStorage"]
  const value = storage.getItem("messages:" + room_id)
  return JSON.parse(value)
}

export function clear_messages(room_id) {
  const storage = window["localStorage"]
  storage.removeItem("messages:" + room_id)
}
