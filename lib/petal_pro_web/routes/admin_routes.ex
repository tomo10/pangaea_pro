defmodule PetalProWeb.AdminRoutes do
  defmacro __using__(_) do
    quote do
      scope "/admin", PetalProWeb do
        pipe_through [:browser, :authenticated, :require_admin_user]

        live_dashboard "/server", metrics: PetalProWeb.Telemetry

        live_session :require_admin_user,
          on_mount: [
            {PetalProWeb.UserOnMountHooks, :require_admin_user}
          ] do
          live "/users", AdminUsersLive, :index
          live "/users/:user_id", AdminUsersLive, :edit
          live "/logs", LogsLive, :index
          live "/jobs", AdminJobsLive
        end
      end
    end
  end
end
