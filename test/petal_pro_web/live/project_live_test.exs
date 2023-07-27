defmodule PetalProWeb.ProjectLiveTest do
  use PetalProWeb.ConnCase

  import Phoenix.LiveViewTest
  import PetalPro.ProjectsFixtures

  @create_attrs %{
    description: "some description",
    donation_required: 42,
    start_date: "2023-07-26T15:19:00",
    title: "some title",
    votes: 42
  }
  @update_attrs %{
    description: "some updated description",
    donation_required: 43,
    start_date: "2023-07-27T15:19:00",
    title: "some updated title",
    votes: 43
  }
  @invalid_attrs %{
    description: nil,
    donation_required: nil,
    start_date: nil,
    title: nil,
    votes: nil
  }

  defp create_project(_) do
    project = project_fixture()
    %{project: project}
  end

  describe "Index" do
    setup [:create_project]

    test "lists all projects", %{conn: conn, project: project} do
      {:ok, _index_live, html} = live(conn, ~p"/app/projects")

      assert html =~ "Listing Projects"
      assert html =~ project.description
    end

    test "saves new project", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/app/projects")

      assert index_live |> element("a", "New Project") |> render_click() =~
               "New Project"

      assert_patch(index_live, ~p"/app/projects/new")

      assert index_live
             |> form("#project-form", project: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#project-form", project: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/app/projects")

      assert html =~ "Project created successfully"
      assert html =~ "some description"
    end

    test "updates project in listing", %{conn: conn, project: project} do
      {:ok, index_live, _html} = live(conn, ~p"/app/projects")

      assert index_live
             |> element("a[href='/projects/#{project.id}/edit']", "Edit")
             |> render_click() =~
               "Edit Project"

      assert_patch(index_live, ~p"/app/projects/#{project}/edit")

      assert index_live
             |> form("#project-form", project: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#project-form", project: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/app/projects")

      assert html =~ "Project updated successfully"
      assert html =~ "some updated description"
    end

    test "deletes project in listing", %{conn: conn, project: project} do
      {:ok, index_live, _html} = live(conn, ~p"/app/projects")

      assert index_live |> element("a[phx-value-id=#{project.id}]", "Delete") |> render_click()
      refute has_element?(index_live, "a[phx-value-id=#{project.id}]")
    end
  end

  describe "Show" do
    setup [:create_project]

    test "displays project", %{conn: conn, project: project} do
      {:ok, _show_live, html} = live(conn, ~p"/app/projects/#{project}")

      assert html =~ "Show Project"
      assert html =~ project.description
    end

    test "updates project within modal", %{conn: conn, project: project} do
      {:ok, show_live, _html} = live(conn, ~p"/app/projects/#{project}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Project"

      assert_patch(show_live, ~p"/app/projects/#{project}/show/edit")

      assert show_live
             |> form("#project-form", project: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#project-form", project: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/app/projects/#{project}")

      assert html =~ "Project updated successfully"
      assert html =~ "some updated description"
    end
  end
end
