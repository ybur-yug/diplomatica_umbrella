defmodule Diplomatica.Web.UserLoader do
  @behaviour Diplomat.ResourceLoader

  alias Diplomatica.Repo
  alias Diplomatica.Schema.User

  def fetch_resource({:get, "/users"}, %{"id" => id}), do: {:ok, Repo.get(User, id)}

  def fetch_resource({:get, "/users"}, _params), do: {:ok, Repo.all(User)}

  def fetch_resource({:get, "/"}, _params), do: {:ok, %{}}
end
