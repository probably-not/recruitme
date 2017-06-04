defmodule RecruitmeLocationJsonTest.Repo.Migrations.CreateJob do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :title, :string
      add :description, :string
      add :company, :string
      add :location, :geography
      add :latitude, :float
      add :longitude, :float

      timestamps()
    end

  end
end
