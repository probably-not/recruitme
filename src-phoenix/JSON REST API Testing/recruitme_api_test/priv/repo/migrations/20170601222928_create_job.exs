defmodule RecruitmeApiTest.Repo.Migrations.CreateJob do
  use Ecto.Migration

  def change do
  	create table(:jobs) do
  		add :jobID, :integer
  		add :title, :string
  		add :description, :string
  		add :company, :string
  		add :location, :string
  		timestamps
  	end

  	create unique_index(:jobs, [:jobID])
  end
end
