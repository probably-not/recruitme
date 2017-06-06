defmodule RecruitmeFullDataModel.Repo.Migrations.CreateJobSeeker do
  use Ecto.Migration

  def change do
    create table(:jobseekers) do
      add :skills, {:array, :string}
      add :education_level, :string
      add :location, :geography
      add :latitude, :float
      add :longitude, :float
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end
    create index(:jobseekers, [:user_id])

  end
end
