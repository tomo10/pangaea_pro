defmodule PetalPro.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :date, :naive_datetime
    field :donation_required, :integer
    field :label, :string

    belongs_to :user, PetalPro.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:label, :donation_required, :date, :user_id])
    |> validate_required([:label, :donation_required, :date])
  end
end
