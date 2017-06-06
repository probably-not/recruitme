defmodule RecruitmeApi.Recruiter do
  use RecruitmeApi.Web, :model

  @derive {Poison.Encoder, only: [:user, :jobs]}
  schema "recruiters" do
    belongs_to :user, RecruitmeApi.User
    has_many :jobs, RecruitmeApi.Job

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
    |> put_assoc(:user, params["user"])
    |> assoc_constraint(:user)
  end
end
