defmodule RecruitmeApi.User do
  use RecruitmeApi.Web, :model

  @derive {Poison.Encoder, only: [:email, :name, :job_seeker, :recruiter]}
  schema "users" do
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    has_one :job_seeker, RecruitmeApi.JobSeeker
    has_one :recruiter, RecruitmeApi.Recruiter

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email])
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}/)
    |> unique_constraint(:email)
  end

  def registration_changeset(struct, params \\ %{}) do
    struct
      |> changeset(params)
      |> cast(params, ~w(password), [])
      |> validate_length(:password, min: 6)
      |> put_password_hash
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
      changeset
    end
  end

end
