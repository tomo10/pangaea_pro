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
        date: ~N[2023-07-19 13:16:00],
        donation_required: 42,
        label: "some label"
      })
      |> PetalPro.Projects.create_project()

    project
  end
end
