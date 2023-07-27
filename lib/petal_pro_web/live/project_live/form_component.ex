defmodule PetalProWeb.ProjectLive.FormComponent do
  use PetalProWeb, :live_component

  alias PetalPro.Projects

  @impl true
  def update(%{project: project} = assigns, socket) do
    changeset = Projects.change_project(project)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"project" => project_params}, socket) do
    changeset =
      socket.assigns.project
      |> Projects.change_project(project_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"project" => project_params}, socket) do
    save_project(socket, socket.assigns.action, project_params)
  end

  defp save_project(socket, :edit, project_params) do
    case Projects.update_project(socket.assigns.project, project_params) do
      {:ok, _project} ->
        {:noreply,
         socket
         |> put_flash(:info, "Project updated successfully")
         |> push_navigate(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_project(socket, :new, project_params) do
    case Projects.create_project(project_params) do
      {:ok, project} ->
        PetalPro.Logs.log("create_project", %{
          user: socket.assigns.current_user,
          metadata: %{
            project_id: project.id,
            project_title: project.title
          }
        })

        {:noreply,
         socket
         |> put_flash(:info, "Project created successfully")
         |> push_navigate(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end
end
