defmodule RecruitmeApi.Job do
  use RecruitmeApi.Web, :model

  @derive {Poison.Encoder, only: [:title, :description, :company, :skills, :education_level, :latitude, :longitude, :recruiter]}
  schema "jobs" do
    field :title, :string
    field :description, :string
    field :company, :string
    field :skills, {:array, :string}
    field :education_level, :string
    field :latitude, :float
    field :longitude, :float
    field :location, Geo.Point
    belongs_to :recruiter, RecruitmeApi.Recruiter

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :company, :skills, :education_level, :latitude, :longitude, :location])
    |> validate_required([:title, :description, :company, :skills, :education_level, :latitude, :longitude, :location])
    |> validate_number(:latitude, greater_than_or_equal_to: -90)
    |> validate_number(:latitude, less_than_or_equal_to: 90)
    |> validate_number(:longitude, greater_than_or_equal_to: -180)
    |> validate_number(:longitude, less_than_or_equal_to: 180)
    |> put_assoc(:recruiter, params["recruiter"])
    |> assoc_constraint(:recruiter)
  end
end
