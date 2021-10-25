defmodule HonestChatWeb.PageController do
  use HonestChatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
