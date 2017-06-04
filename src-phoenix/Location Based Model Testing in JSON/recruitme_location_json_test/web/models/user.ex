defmodule RecruitmeLocationJsonTest.User do
  use RecruitmeLocationJsonTest.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :location, Geo.Point
    field :latitude, :float
    field :longitude, :float

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :location, :latitude, :longitude])
    |> validate_required([:name, :email, :location, :latitude, :longitude])
  end
end
