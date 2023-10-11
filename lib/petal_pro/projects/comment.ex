defmodule PetalPro.Projects.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field(:content, :string)
    field(:creation_date, :date)
    # creation date will be there automatically with timestamps so can be removed

    belongs_to(:user, PetalPro.Accounts.User)
    belongs_to(:project, PetalPro.Projects.Project)

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content, :creation_date, :user_id, :project_id])
    |> validate_required([:content, :creation_date, :user_id, :project_id])
  end
end
