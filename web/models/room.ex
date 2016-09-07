defmodule Peepchat.Room do
  use Peepchat.Web, :model

  schema "rooms" do
    field :name, :string
    belongs_to :owner, Peepchat.Owner

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  @required_fields ~w(name)
  @optional_fields ~w()

   def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:name, min: 4)
    |> unique_constraint(:name)
  end
end
