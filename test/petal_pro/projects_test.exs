defmodule PetalPro.ProjectsTest do
  use PetalPro.DataCase

  alias PetalPro.Projects

  describe "projects" do
    alias PetalPro.Projects.Project

    import PetalPro.ProjectsFixtures

    @invalid_attrs %{date: nil, donation_required: nil, label: nil}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Projects.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Projects.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{date: ~N[2023-07-19 13:16:00], donation_required: 42, label: "some label"}

      assert {:ok, %Project{} = project} = Projects.create_project(valid_attrs)
      assert project.date == ~N[2023-07-19 13:16:00]
      assert project.donation_required == 42
      assert project.label == "some label"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{date: ~N[2023-07-20 13:16:00], donation_required: 43, label: "some updated label"}

      assert {:ok, %Project{} = project} = Projects.update_project(project, update_attrs)
      assert project.date == ~N[2023-07-20 13:16:00]
      assert project.donation_required == 43
      assert project.label == "some updated label"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project(project, @invalid_attrs)
      assert project == Projects.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Projects.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Projects.change_project(project)
    end
  end

  describe "projects" do
    alias PetalPro.Projects.Project

    import PetalPro.ProjectsFixtures

    @invalid_attrs %{description: nil, donation_required: nil, start_date: nil, title: nil}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Projects.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Projects.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{description: "some description", donation_required: 42, start_date: ~N[2023-07-26 15:13:00], title: "some title"}

      assert {:ok, %Project{} = project} = Projects.create_project(valid_attrs)
      assert project.description == "some description"
      assert project.donation_required == 42
      assert project.start_date == ~N[2023-07-26 15:13:00]
      assert project.title == "some title"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{description: "some updated description", donation_required: 43, start_date: ~N[2023-07-27 15:13:00], title: "some updated title"}

      assert {:ok, %Project{} = project} = Projects.update_project(project, update_attrs)
      assert project.description == "some updated description"
      assert project.donation_required == 43
      assert project.start_date == ~N[2023-07-27 15:13:00]
      assert project.title == "some updated title"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project(project, @invalid_attrs)
      assert project == Projects.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Projects.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Projects.change_project(project)
    end
  end

  describe "projects" do
    alias PetalPro.Projects.Project

    import PetalPro.ProjectsFixtures

    @invalid_attrs %{description: nil, donation_required: nil, start_date: nil, title: nil, votes: nil}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Projects.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Projects.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{description: "some description", donation_required: 42, start_date: ~N[2023-07-26 15:19:00], title: "some title", votes: 42}

      assert {:ok, %Project{} = project} = Projects.create_project(valid_attrs)
      assert project.description == "some description"
      assert project.donation_required == 42
      assert project.start_date == ~N[2023-07-26 15:19:00]
      assert project.title == "some title"
      assert project.votes == 42
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{description: "some updated description", donation_required: 43, start_date: ~N[2023-07-27 15:19:00], title: "some updated title", votes: 43}

      assert {:ok, %Project{} = project} = Projects.update_project(project, update_attrs)
      assert project.description == "some updated description"
      assert project.donation_required == 43
      assert project.start_date == ~N[2023-07-27 15:19:00]
      assert project.title == "some updated title"
      assert project.votes == 43
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project(project, @invalid_attrs)
      assert project == Projects.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Projects.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Projects.change_project(project)
    end
  end
end
