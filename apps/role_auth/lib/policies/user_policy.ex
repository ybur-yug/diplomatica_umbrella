defmodule RoleAuth.UserPolicy do
  @behaviour Diplomat.Policy

  alias Diplomatica.Schema.User

  # I'm on god mode
  def permitted?(%User{email: "bobbygrayson@gmail.com"}, _request, _resource), do: true

  # Users can access themselves
  def permitted?(%User{id: id}, _request, %User{id: id}), do: true

  # Not match, no access
  def permitted?(_, _, _), do: false
end
