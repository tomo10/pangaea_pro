defmodule PetalPro.SuveryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PetalPro.Suvery` context.
  """

  @doc """
  Generate a demographic.
  """
  def demographic_fixture(attrs \\ %{}) do
    {:ok, demographic} =
      attrs
      |> Enum.into(%{
        nationality: "some nationality",
        year_of_birth: 42
      })
      |> PetalPro.Suvery.create_demographic()

    demographic
  end
end
