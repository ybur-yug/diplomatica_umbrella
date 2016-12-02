defmodule Diplomatica.Web.PageController do
  use Diplomatica.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
