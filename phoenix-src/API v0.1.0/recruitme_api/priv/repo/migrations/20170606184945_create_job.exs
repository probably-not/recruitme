defmodule RecruitmeApi.Repo.Migrations.CreateJob do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :title, :string
      add :description, :string
      add :company, :string
      add :skills, {:array, :string}
      add :education_level, :string
      add :latitude, :float
      add :longitude, :float
      add :location, :geography
      add :recruiter_id, references(:recruiters, on_delete: :delete_all), null: false

      timestamps()
    end
    create index(:jobs, [:recruiter_id])

  end
end
