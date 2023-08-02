defmodule PetalPro.Survey.Demographic.Query do
  import Ecto.Query
  alias PetalPro.Survey.Demographic

  def base, do: Demographic

  def for_user(query \\ base(), user) do
    where(query, [d], d.user_id == ^user.id)
  end
end
