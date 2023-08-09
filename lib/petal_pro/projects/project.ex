defmodule PetalPro.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  # think what categories are needed so can filter by:
  # type: dontation vs awareness
  # category: carbon capture, land protection, animal protection

  schema "projects" do
    field(:description, :string)
    field(:donation_required, :integer)
    field(:start_date, :naive_datetime)
    field(:title, :string)
    field(:votes, :integer)
    field(:image_upload, :string)

    belongs_to(:user, PetalPro.Accounts.User)
    has_many(:comments, PetalPro.Projects.Comment)

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [
      :title,
      :description,
      :votes,
      :donation_required,
      :start_date,
      :image_upload,
      :user_id
    ])
    |> validate_required([
      :title,
      :description,
      :votes,
      :donation_required,
      :start_date,
      :image_upload,
      :user_id
    ])
  end
end
