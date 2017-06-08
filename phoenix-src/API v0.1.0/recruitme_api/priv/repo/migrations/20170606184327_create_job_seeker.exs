defmodule RecruitmeApi.Repo.Migrations.CreateJobSeeker do
  use Ecto.Migration

  def change do
    create table(:jobseekers) do
      add :skills, {:array, :string}
      add :education_level, :string
      add :latitude, :float, null: false
      add :longitude, :float, null: false
      add :location, :geography, null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end
    create index(:jobseekers, [:user_id])

  end
end
