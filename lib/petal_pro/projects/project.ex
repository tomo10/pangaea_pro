defmodule PetalPro.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :description, :string
    field :donation_required, :integer
    field :start_date, :naive_datetime
    field :title, :string
    field :votes, :integer
    field :image_upload, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:title, :description, :votes, :donation_required, :start_date, :image_upload])
    |> validate_required([:title, :description, :votes, :donation_required, :start_date])
  end
end
