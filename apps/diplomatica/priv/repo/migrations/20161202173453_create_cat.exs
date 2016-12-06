defmodule Diplomatica.Repo.Migrations.CreateCat do
  use Ecto.Migration

  def change do
    create table(:cats) do
      add :name, :string
      add :rating, :float

      timestamps()
    end
  end
end
