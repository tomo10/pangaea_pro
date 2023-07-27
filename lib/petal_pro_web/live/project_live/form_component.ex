defmodule PetalProWeb.ProjectLive.FormComponent do
  use PetalProWeb, :live_component

  alias PetalPro.Projects

  @impl true
  def update(%{project: project} = assigns, socket) do
    changeset = Projects.change_project(project)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)
     |> allow_upload(:image,
       accept: ~w(.jpg .jpeg .png),
       max_entries: 1,
       max_file_size: 9_000_000,
       auto_upload: true
     )}
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

  defp save_project(socket, :edit, params) do
    project_params = params_with_image(socket, params)

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

  defp save_project(socket, :new, params) do
    with_image_params = params_with_image(socket, params)

    project_params = Map.put(with_image_params, "user_id", socket.assigns.current_user.id)

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

  def params_with_image(socket, params) do
    path = socket |> consume_uploaded_entries(:image, &upload_static_file/2) |> List.first()
    Map.put(params, "image_upload", path)
  end

  defp upload_static_file(%{path: path}, _entry) do
    # Plug in your production image file persistence implementation here!
    filename = Path.basename(path)
    dest = Path.join("priv/static/images", filename)
    File.cp!(path, dest)
    {:ok, ~p"/images/#{filename}"}
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end
end
