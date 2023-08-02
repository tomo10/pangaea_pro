defmodule PetalPro.Repo.Migrations.CreateDemographics do
  use Ecto.Migration

  def change do
    create table(:demographics) do
      add :year_of_birth, :integer
      add :nationality, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:demographics, [:user_id])
  end
end
