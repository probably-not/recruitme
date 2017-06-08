defmodule RecruitmeApi.Repo.Migrations.CreateJob do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :title, :string, null: false
      add :description, :string, null: false
      add :company, :string, null: false
      add :skills, {:array, :string}
      add :education_level, :string
      add :latitude, :float, null: false
      add :longitude, :float, null: false
      add :location, :geography, null: false
      add :recruiter_id, references(:recruiters, on_delete: :delete_all), null: false

      timestamps()
    end
    create index(:jobs, [:recruiter_id])

  end
end
