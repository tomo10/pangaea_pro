defmodule PetalProWeb.ProjectLive.Show do
  use PetalProWeb, :live_view

  alias PetalPro.Projects

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:project, Projects.get_project!(id))}
  end

  @impl true
  def handle_event("close_modal", _, socket) do
    {:noreply, push_patch(socket, to: ~p"/app/projects/#{socket.assigns.project}")}
  end

  def handle_event("up_vote", %{"id" => id}, socket) do
    project = Projects.get_project!(id)

    {:ok, project} = Projects.update_project(project, %{votes: project.votes + 1})

    {:noreply, assign(socket, project: project)}
  end

  defp page_title(:show), do: "Show Project"
  defp page_title(:edit), do: "Edit Project"
end
