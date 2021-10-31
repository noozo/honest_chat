defmodule HonestChatWeb.PageController do
  use HonestChatWeb, :controller

  def index(conn, _params) do
    if conn.assigns.current_user do
      render(conn, "index.html")
    else
      redirect(conn, to: Routes.user_session_path(conn, :new))
    end
  end
end
