defmodule Cardserver.PageController do
  use Cardserver.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
