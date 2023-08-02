defmodule PetalPro.SurveyTest do
  use PetalPro.DataCase

  alias PetalPro.Survey

  describe "demographics" do
    alias PetalPro.Survey.Demographic

    import PetalPro.SurveyFixtures

    @invalid_attrs %{nationality: nil, year_of_birth: nil}

    test "list_demographics/0 returns all demographics" do
      demographic = demographic_fixture()
      assert Survey.list_demographics() == [demographic]
    end

    test "get_demographic!/1 returns the demographic with given id" do
      demographic = demographic_fixture()
      assert Survey.get_demographic!(demographic.id) == demographic
    end

    test "create_demographic/1 with valid data creates a demographic" do
      valid_attrs = %{
        nationality: "some nationality",
        year_of_birth: 42,
        user_id: user_fixture().id
      }

      assert {:ok, %Demographic{} = demographic} = Survey.create_demographic(valid_attrs)
      assert demographic.nationality == "some nationality"
      assert demographic.year_of_birth == 42
    end

    test "create_demographic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Survey.create_demographic(@invalid_attrs)
    end

    test "update_demographic/2 with valid data updates the demographic" do
      demographic = demographic_fixture()
      update_attrs = %{nationality: "some updated nationality", year_of_birth: 43}

      assert {:ok, %Demographic{} = demographic} =
               Survey.update_demographic(demographic, update_attrs)

      assert demographic.nationality == "some updated nationality"
      assert demographic.year_of_birth == 43
    end

    test "update_demographic/2 with invalid data returns error changeset" do
      demographic = demographic_fixture()
      assert {:error, %Ecto.Changeset{}} = Survey.update_demographic(demographic, @invalid_attrs)
      assert demographic == Survey.get_demographic!(demographic.id)
    end

    test "delete_demographic/1 deletes the demographic" do
      demographic = demographic_fixture()
      assert {:ok, %Demographic{}} = Survey.delete_demographic(demographic)
      assert_raise Ecto.NoResultsError, fn -> Survey.get_demographic!(demographic.id) end
    end

    test "change_demographic/1 returns a demographic changeset" do
      demographic = demographic_fixture()
      assert %Ecto.Changeset{} = Survey.change_demographic(demographic)
    end
  end
end
