defmodule Diplomatica.Web.Handlers.ErrorHandler do
  @behaviour Diplomat.Handler

  import Plug.Conn

  def resource_missing(conn), do: send_resp(conn, 404, "not found")
  def unauthenticated(conn), do: send_resp(conn, 401, "unauthorized")
  def unauthorized(conn), do: send_resp(conn, 403, "unauthorized")
end
