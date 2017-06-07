defmodule RecruitmeApi.LocationQuery do
  use RecruitmeApi.Web, :model

  @derive {Poison.Encoder, only: [:title, :description, :company, :skills, :education_level, :latitude, :longitude, :recruiter]}
  schema "locationqueries" do
    field :latitude, :float
    field :longitude, :float
    field :radius, :float

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:latitude, :longitude, :radius])
    |> validate_required([:latitude, :longitude, :radius])
    |> validate_number(:latitude, greater_than_or_equal_to: -90)
    |> validate_number(:latitude, less_than_or_equal_to: 90)
    |> validate_number(:longitude, greater_than_or_equal_to: -180)
    |> validate_number(:longitude, less_than_or_equal_to: 180)
    |> validate_number(:radius, less_than_or_equal_to: 40000000)
  end
end
