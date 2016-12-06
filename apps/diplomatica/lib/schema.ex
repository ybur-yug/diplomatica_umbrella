defmodule Diplomatica.Schema do
  defmacro __using__(_) do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query, only: [from: 1, from: 2]

      @timestamps_opts [type: Ecto.DateTime,
                        usec: false]
    end
  end
end
