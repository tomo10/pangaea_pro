defmodule PetalProWeb.ProjectLive.Index do
  use PetalProWeb, :live_view

  alias PetalPro.Projects
  alias PetalPro.Projects.Project
  alias PetalFramework.Components.DataTable

  @data_table_opts [
    default_limit: 10,
    default_order: %{
      order_by: [:id, :inserted_at],
      order_directions: [:asc, :asc]
    },
    sortable: [:id, :inserted_at, :label, :donation_required, :date],
    filterable: [:id, :inserted_at, :label, :donation_required, :date]
  ]

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, index_params: nil)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Project")
    |> assign(:project, Projects.get_project!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Project")
    |> assign(:project, %Project{})
  end

  defp apply_action(socket, :index, params) do
    socket
    |> assign(:page_title, "Listing Projects")
    |> assign_projects(params)
    |> assign(index_params: params)
  end

  defp current_index_path(index_params) do
    ~p"/projects?#{index_params || %{}}"
  end

  @impl true
  def handle_event("update_filters", params, socket) do
    query_params = DataTable.build_filter_params(socket.assigns.meta.flop, params)
    {:noreply, push_patch(socket, to: ~p"/projects?#{query_params}")}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    project = Projects.get_project!(id)
    {:ok, _} = Projects.delete_project(project)

    socket =
      socket
      |> assign_projects(socket.assigns.index_params)
      |> put_flash(:info, "Project deleted")

    {:noreply, socket}
  end

  @impl true
  def handle_event("close_modal", _, socket) do
    {:noreply, push_patch(socket, to: current_index_path(socket.assigns.index_params))}
  end

  defp assign_projects(socket, params) do
    starting_query = Project
    {projects, meta} = DataTable.search(starting_query, params, @data_table_opts)
    assign(socket, projects: projects, meta: meta)
  end
end
