defmodule PetalPro.ProjectsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PetalPro.Projects` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        description: "some description",
        donation_required: 42,
        start_date: ~N[2023-07-26 15:19:00],
        title: "some title",
        votes: 42
      })
      |> PetalPro.Projects.create_project()

    project
  end

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        content: "some content",
        creation_date: ~D[2023-08-02]
      })
      |> PetalPro.Projects.create_comment()

    comment
  end
end
