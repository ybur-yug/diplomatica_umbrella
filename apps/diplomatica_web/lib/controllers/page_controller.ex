defmodule Diplomatica.Web.PageController do
  use Diplomatica.Web, :controller

  def index(conn, _params) do
    IO.inspect conn.assigns[:user_agent_string]
    render conn, "index.html"
  end
end
