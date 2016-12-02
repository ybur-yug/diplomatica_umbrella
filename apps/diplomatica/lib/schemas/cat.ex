defmodule Diplomatica.Cat do
  use Ecto.Schema

  schema "cats" do
    field :name, :string
    field :rating, :float

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :rating])
    |> validate_required([:name, :rating])
  end
end
