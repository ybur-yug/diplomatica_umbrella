#defmodule Diplomatica.CatTest do
#  use Diplomatica.SchemaCase
#
#  alias Diplomatica.Cat
#
#  @valid_attrs %{account_id: 1, first_name: "First", email: "first@example.com", last_name: "Last"}
#  @invalid_attrs %{account_id: 1, first_name: "First", last_name: "Last"}
#
#  test "changeset with valid attributes" do
#    changeset = Cat.changeset(%Cat{}, @valid_attrs)
#    assert changeset.valid?
#  end
#
#  test "changeset with invalid attributes" do
#    changeset = Cat.changeset(%Cat{}, @invalid_attrs)
#    refute changeset.valid?
#  end
#end
