alias PetalPro.Accounts
alias PetalPro.Accounts.User
alias PetalPro.Accounts.UserNotifier
alias PetalPro.Accounts.UserQuery
alias PetalPro.Accounts.UserSeeder
alias PetalPro.Accounts.UserSeeder
alias PetalPro.Logs
alias PetalPro.Logs.Log
alias PetalPro.MailBluster
alias PetalPro.Orgs
alias PetalPro.Orgs.Invitation
alias PetalPro.Orgs.Membership
alias PetalPro.Repo
alias PetalPro.Slack

# Don't cut off inspects with "..."
IEx.configure(inspect: [limit: :infinity])

# Allow copy to clipboard
# eg:
#    iex(1)> Phoenix.Router.routes(PetalProWeb.Router) |> Helpers.copy
#    :ok
defmodule Helpers do
  def copy(term) do
    text =
      if is_binary(term) do
        term
      else
        inspect(term, limit: :infinity, pretty: true)
      end

    port = Port.open({:spawn, "pbcopy"}, [])
    true = Port.command(port, text)
    true = Port.close(port)

    :ok
  end
end
