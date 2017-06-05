defmodule RecruitmeFullDataModel.Repo.Migrations.CreateJob do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :title, :string
      add :description, :string
      add :company, :string
      add :skills, {:array, :string}
      add :education_level, :string
      add :location, :geography
      add :latitude, :float
      add :longitude, :float
      add :recruiter_id, references(:recruiters, on_delete: :nothing)

      timestamps()
    end
    create index(:jobs, [:recruiter_id])

  end
end
