defmodule PetalProWeb.PeopleLive do
  alias PetalPro.Accounts
  alias PetalPro.Survey
  alias PetalProWeb.DemographicLive
  alias __MODULE__.Component

  use PetalProWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign_demographic()
     |> assign_users()}
  end

  defp assign_demographic(%{assigns: %{current_user: current_user}} = socket) do
    assign(
      socket,
      :demographic,
      Survey.get_demographic_by_user(current_user)
    )
  end

  defp assign_users(socket) do
    assign(
      socket,
      :users,
      Accounts.get_users()
    )
  end
end
