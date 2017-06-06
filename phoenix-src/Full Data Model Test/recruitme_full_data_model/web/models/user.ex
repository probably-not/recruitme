defmodule RecruitmeFullDataModel.User do
  use RecruitmeFullDataModel.Web, :model

  @derive {Poison.Encoder, only: [:email, :name, :job_seeker, :recruiter]}
  schema "users" do
    field :email, :string
    field :name, :string
    has_one :job_seeker, RecruitmeFullDataModel.JobSeeker
    has_one :recruiter, RecruitmeFullDataModel.Recruiter

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :name])
    |> validate_required([:email, :name])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end
end
