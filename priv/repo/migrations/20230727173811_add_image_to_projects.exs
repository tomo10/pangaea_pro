defmodule PetalPro.Repo.Migrations.AddImageToProjects do
  use Ecto.Migration

  def change do
    alter table(:projects) do
      add :image_upload, :string
    end
  end
end
