defmodule RecruitmeFullDataModel.Job do
  use RecruitmeFullDataModel.Web, :model

  schema "jobs" do
    field :title, :string
    field :description, :string
    field :company, :string
    field :skills, {:array, :string}
    field :education_level, :string
    field :location, Geo.Point
    field :latitude, :float
    field :longitude, :float
    belongs_to :recruiter, RecruitmeFullDataModel.Recruiter

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :company, :skills, :education_level, :location, :latitude, :longitude])
    |> validate_required([:title, :description, :company, :skills, :education_level, :location, :latitude, :longitude])
  end
end
