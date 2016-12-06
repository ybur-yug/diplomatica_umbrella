defmodule UaPlug do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    user_agent   = extract_user_agent(conn)
    updated_conn = assign(conn, :user_agent_string, user_agent)
    updated_conn = assign(conn, :current_user, user_agent)
    updated_conn
  end

  defp extract_user_agent(conn) do
    conn
      |> Plug.Conn.get_req_header("user-agent")
      |> List.first()
      |> UAParser.parse()
  end
end
