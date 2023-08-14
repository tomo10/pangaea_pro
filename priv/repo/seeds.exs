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
      email: "thce28@gmail.com",
      name: "Sarah Cunningham",
      password: "password",
      confirmed_at: Timex.to_naive_datetime(Timex.now())
    })

  org = OrgSeeder.random_org(admin)
  PetalPro.Orgs.create_invitation(org, %{email: normal_user.email})

  UserSeeder.random_users(20)

  ### Projects

  images_url = "#{PangaeaWeb.Endpoint.url()}/images"

  turtle =
    %Project{}
    |> Project.changeset(%{
      name: "Save the Turtles",
      description:
        "These guys are the most cracking looking things in the sea. Let's look after them.",
      location: "Sea of Cortez",
      donation: Decimal.from_float(1000.00),
      image: "#{images_url}/turtle.jpg"
    })
    |> Repo.insert!()

  rhino =
    %Project{}
    |> Project.changeset(%{
      name: "Black Rhino Conservation",
      description:
        "Please help up protect this magnificent animal. Less then 3000 remain in the wild.",
      location: "Kruger National Park",
      donation_required: Decimal.from_float(5000.00),
      image: "#{images_url}/blackRhino.jpg",
      comments: [
        %Comment{
          content: "Good work",
          user: tomo,
          inserted_at: DateTime.from_naive!(~N[2021-01-15 15:00:00], "Etc/UTC")
        }
      ]
    })
    |> Repo.insert!()

  %Project{}
  |> Project.changeset(%{
    name: "Rainforest Trust",
    description: "Preserve the lungs of the Earth",
    location: "Costa Rica Cloud Forest",
    donation_required: Decimal.from_float(15000.00),
    image: "#{images_url}/amazon.jpg",
    comments: [
      %Comment{
        content: "I love Oxygen",
        user: tomo,
        inserted_at: DateTime.from_naive!(~N[2021-03-15 22:00:00], "Etc/UTC")
      }
    ]
  })
  |> Repo.insert!()

  %Project{}
  |> Project.changeset(%{
    name: "Snow Leopard Fund",
    description: "Help protect the habitat of this critically endagered mammal",
    location: "Himalayas - India, Ladakh",
    donation_required: Decimal.from_float(8000.00),
    image: "#{images_url}/snowLeopard.jpg"
  })
  |> Repo.insert!()

  %Project{}
  |> Project.changeset(%{
    name: "Painted Dogs Protection",
    description:
      "Please support these beautiful animals which are threatened by a loss of habitat",
    location: "Botswana - Chobe National Park",
    donation_required: Decimal.from_float(20000.00),
    image: "#{images_url}/wildDogs.jpg"
  })
  |> Repo.insert!()
end
