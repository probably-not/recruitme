defmodule RecruitmeFullDataModel.JobSeeker do
  use RecruitmeFullDataModel.Web, :model

  @derive {Poison.Encoder, only: [:skills, :education_level, :latitude, :longitude, :user]}
  schema "jobseekers" do
    field :skills, {:array, :string}
    field :education_level, :string
    field :location, Geo.Point
    field :latitude, :float
    field :longitude, :float
    belongs_to :user, RecruitmeFullDataModel.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:skills, :education_level, :location, :latitude, :longitude])
    |> validate_required([:skills, :education_level, :location, :latitude, :longitude])
    |> validate_number(:latitude, greater_than_or_equal_to: -90)
    |> validate_number(:latitude, less_than_or_equal_to: 90)
    |> validate_number(:longitude, greater_than_or_equal_to: -180)
    |> validate_number(:longitude, less_than_or_equal_to: 180)
    |> put_assoc(:user, params["user"])
    |> assoc_constraint(:user)
  end
end
