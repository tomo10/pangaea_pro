defmodule PetalProWeb.HomeLive do
  alias PetalPro.Projects
  use PetalProWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign_projects(socket)}
  end

  defp assign_projects(socket) do
    assign(socket, :projects, Projects.list_projects())
  end
end
