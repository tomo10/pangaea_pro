defmodule PetalPro.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PetalPro.Repo,
      # Start the Telemetry supervisor
      PetalProWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PetalPro.PubSub},
      # Start the Endpoint (http/https)
      PetalProWeb.Endpoint,
      {Task.Supervisor, name: PetalPro.BackgroundTask},
      # HTTP adapter for Tesla
      {Finch, name: PetalPro.Finch},
      {Oban, Application.fetch_env!(:petal_pro, Oban)}
      # Start a worker by calling: PetalPro.Worker.start_link(arg)
      # {PetalPro.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PetalPro.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PetalProWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
