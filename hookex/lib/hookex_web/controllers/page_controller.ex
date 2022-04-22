defmodule HookexWeb.PageController do
  use HookexWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
