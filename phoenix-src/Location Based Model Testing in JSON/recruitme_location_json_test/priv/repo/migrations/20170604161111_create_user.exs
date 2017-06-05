defmodule RecruitmeLocationJsonTest.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :location, :geography
      add :latitude, :float
      add :longitude, :float

      timestamps()
    end

  end
end
