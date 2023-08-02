defmodule PetalProWeb.DemographicLive.Show do
  use Phoenix.Component
  use Phoenix.HTML
  alias PetalPro.Survey.Demographic

  attr :demographic, Demographic, required: true

  def details(assigns) do
    ~H"""
    <div>
      <h2 class="font-medium text-2xl">Your demographic details are <%= raw("&#x2713;") %></h2>
      <ul>
        <li>Nationality: <%= @demographic.nationality %></li>
        <li>Year of birth: <%= @demographic.year_of_birth %></li>
      </ul>
    </div>
    """
  end
end
