defmodule PetalProWeb.EditOrgLive do
  use PetalProWeb, :live_view
  alias PetalPro.Orgs
  import PetalProWeb.OrgSettingsLayoutComponent

  on_mount {PetalProWeb.OrgOnMountHooks, :require_org_admin}

  @impl true
  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        changeset: Orgs.change_org(socket.assigns.current_org, %{}),
        page_title: gettext("Editing %{org_name}", org_name: socket.assigns.current_org.name)
      )

    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.org_settings_layout
      current_page={:edit_org}
      current_user={@current_user}
      current_org={@current_org}
      current_membership={@current_membership}
      socket={@socket}
    >
      <.live_component
        module={PetalProWeb.OrgFormComponent}
        id={:edit}
        action={:edit}
        org={@current_org}
        return_to={~p"/app/org/#{@current_org.slug}/edit"}
        current_user={@current_user}
      />
    </.org_settings_layout>
    """
  end
end
