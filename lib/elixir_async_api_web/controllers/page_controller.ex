defmodule ElixirAsyncApiWeb.PageController do
  use ElixirAsyncApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
