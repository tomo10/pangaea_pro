defmodule PetalPro.Projects.Comments.Query do
  import Ecto.Query
  alias PetalPro.Projects.Comment

  def base, do: Comment

  def for_project(query \\ base(), project) do
    where(query, [c], c.project_id == ^project.id)
  end
end
