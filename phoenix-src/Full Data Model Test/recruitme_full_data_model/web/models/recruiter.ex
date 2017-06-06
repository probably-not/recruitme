defmodule RecruitmeFullDataModel.Recruiter do
  use RecruitmeFullDataModel.Web, :model

  @derive {Poison.Encoder, only: [:user, :jobs]}
  schema "recruiters" do
    belongs_to :user, RecruitmeFullDataModel.User
    has_many :jobs, RecruitmeFullDataModel.Job

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
