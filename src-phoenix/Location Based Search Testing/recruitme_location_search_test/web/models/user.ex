defmodule RecruitmeLocationSearchTest.User do
  use RecruitmeLocationSearchTest.Web, :model

  import Ecto.Query
  import Geo.PostGIS
  
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

  def within(latitude, longitude, radius) do
    point2 = %Geo.Point{coordinates: {longitude, latitude}}
    query = from user in RecruitmeLocationSearchTest.User, where: st_distance(user.location, ^point2)  < ^radius,  select: user
    RecruitmeLocationSearchTest.Repo.all(query)
  end

end