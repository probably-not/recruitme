defmodule RecruitmeLocationSearchTest.User do
  use RecruitmeLocationSearchTest.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :location, Geo.Point

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :location])
    |> validate_required([:name, :email, :location])
  end
end
