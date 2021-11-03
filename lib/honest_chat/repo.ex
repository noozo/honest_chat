defmodule HonestChat.Repo do
  @moduledoc false
  use Ecto.Repo,
    otp_app: :honest_chat,
    adapter: Ecto.Adapters.Postgres
end
