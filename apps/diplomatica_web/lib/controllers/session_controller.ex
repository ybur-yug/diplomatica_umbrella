defmodule Diplomatica.Web.SessionController do
  use Diplomatica.Web, :controller

  alias Diplomatica.Repo
  alias Diplomatica.Schema.User

  def new(conn, params) do
    changeset = User.changeset(%User{})
    render(conn, Diplomatica.Web.SessionView, "new.html", changeset: changeset)
  end

  def create(conn, params = %{}) do
    [user|_] = Repo.all(User) # lazy hack for now
    if user do
      changeset = User.changeset(user, params["user"])
      if changeset.valid? do
        conn
        |> put_flash(:info, "Logged in.")
        |> Guardian.Plug.sign_in(user, :token)
        |> redirect(to: user_path(conn, :index))
      else
        render(conn, "new.html", changeset: changeset)
      end
    else
      changeset = User.changeset(%User{}) |> Ecto.Changeset.add_error(:login, "not found")
      render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, _params) do
    Guardian.Plug.sign_out(conn)
    |> put_flash(:info, "Logged out successfully.")
    |> redirect(to: "/")
  end
end
