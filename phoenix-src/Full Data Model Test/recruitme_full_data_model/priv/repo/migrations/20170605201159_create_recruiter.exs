defmodule RecruitmeFullDataModel.Repo.Migrations.CreateRecruiter do
  use Ecto.Migration

  def change do
    create table(:recruiters) do
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end
    create index(:recruiters, [:user_id])

  end
end
