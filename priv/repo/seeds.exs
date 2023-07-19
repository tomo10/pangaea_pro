# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PetalPro.Repo.insert!(%PetalPro.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias PetalPro.Accounts.User
alias PetalPro.Accounts.UserSeeder
alias PetalPro.Accounts.UserToken
alias PetalPro.Accounts.UserTOTP
alias PetalPro.Logs.Log
alias PetalPro.Orgs.Org
alias PetalPro.Orgs.OrgSeeder

alias PetalPro.Orgs.Invitation
alias PetalPro.Orgs.Membership

if Mix.env() == :dev do
  PetalPro.Repo.delete_all(Log)
  PetalPro.Repo.delete_all(UserTOTP)
  PetalPro.Repo.delete_all(Invitation)
  PetalPro.Repo.delete_all(Membership)
  PetalPro.Repo.delete_all(Org)
  PetalPro.Repo.delete_all(UserToken)
  PetalPro.Repo.delete_all(User)

  admin = UserSeeder.admin()

  normal_user =
    UserSeeder.normal_user(%{
      email: "user@example.com",
      name: "Sarah Cunningham",
      password: "password",
      confirmed_at: Timex.to_naive_datetime(Timex.now())
    })

  org = OrgSeeder.random_org(admin)
  PetalPro.Orgs.create_invitation(org, %{email: normal_user.email})

  UserSeeder.random_users(20)
end
