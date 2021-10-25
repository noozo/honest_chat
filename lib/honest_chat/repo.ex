defmodule HonestChat.Repo do
  use Ecto.Repo,
    otp_app: :honest_chat,
    adapter: Ecto.Adapters.Postgres
end
