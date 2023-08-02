defmodule PetalProWeb.PeopleLive do
  alias PetalPro.Survey
  alias PetalProWeb.DemographicLive
  alias __MODULE__.Component

  use PetalProWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign_demographic(socket)}
  end

  defp assign_demographic(%{assigns: %{current_user: current_user}} = socket) do
    assign(
      socket,
      :demographic,
      Survey.get_demographic_by_user(current_user)
    )
  end
end
