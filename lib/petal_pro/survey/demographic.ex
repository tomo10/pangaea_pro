defmodule PetalPro.Survey.Demographic do
  use Ecto.Schema
  import Ecto.Changeset
  alias PetalPro.Accounts.User

  schema "demographics" do
    field :nationality, :string
    field :year_of_birth, :integer
    # field :user_id, :id
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(demographic, attrs) do
    demographic
    |> cast(attrs, [:year_of_birth, :nationality, :user_id])
    |> validate_required([:year_of_birth, :nationality, :user_id])
    |> validate_inclusion(:year_of_birth, 1900..2023)
    |> unique_constraint(:user_id)
  end
end
