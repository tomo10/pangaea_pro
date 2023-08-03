defmodule PetalProWeb.ProjectLive.Show do
  use PetalProWeb, :live_view

  alias PetalPro.Projects
  alias PetalPro.Projects.Comment

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    project = Projects.get_project!(id)
    comments = Projects.list_comments_from_project(project)
    changeset = Comment.changeset(%Comment{}, %{project: project})

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:project, project)
     |> assign(:comments, comments)
     |> assign(:form, to_form(changeset))}
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

  def handle_event("send_message", %{"comment" => %{"message" => message}}, socket) do
    comment_attrs = %{
      content: message,
      creation_date: ~D[2023-08-03],
      project_id: socket.assigns.project.id,
      user_id: socket.assigns.current_user.id
    }

    case Projects.create_comment(comment_attrs) do
      {:ok, _comment} ->
        {:noreply, assign(socket, :form, to_form(Projects.change_comment(%Comment{})))}

      {:error, changeset} ->
        {:noreply, assign(socket, :form, to_form(changeset))}
    end
  end

  defp page_title(:show), do: "Show Project"
  defp page_title(:edit), do: "Edit Project"
end
