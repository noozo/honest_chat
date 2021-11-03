defmodule HonestChatWeb.Live.Auth do
  @moduledoc """
  This live view is responsible for authentication
  within live sessions. See the router for how it's used.
  """
  import Phoenix.LiveView

  alias HonestChat.Accounts
  alias HonestChat.Accounts.User

  def on_mount(:default, _params, %{"user_token" => token} = _session, socket) do
    case Accounts.get_user_by_session_token(token) do
      %User{} = user -> {:cont, assign(socket, current_user: user)}
      _error -> {:halt, redirect(socket, to: "/users/log_in")}
    end
  end

  def on_mount(:default, _params, _session, socket) do
    {:halt, redirect(socket, to: "/users/log_in")}
  end
end
