defmodule PetalPro.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :date, :naive_datetime
    field :donation_required, :integer
    field :label, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:label, :donation_required, :date])
    |> validate_required([:label, :donation_required, :date])
  end
end
