<p align="center">
  <img src="/priv/static/images/logo_for_emails.png" height="128">

  <p align="center">
    Join us on preserving the natural world
  </p>
</p>

## Manifesto

In the relatively short time that humans have been the dominant species on this planet, the natural world has seen enormous suffering. By acting with scant regard for the natural world we have pushed animals to extinction and our rainforests and other biodiverse regions to the brink. This has profound implications for the future of our planet and the millions of species that call it home.

As a group of 8bn people we have struggled to gather the collective wisdom or garner the will to coordinate and prevent the attrocities that are befalling our natural world on a daily basis. This has severe implications not only for the regions that we call home and the animals that we share it with, but also for us. If, like me, you wonder are we fighting for our own futures, for theirs, or for the futures of every living thing on this planet, the fact is a less biodiverse world is a poorer one for allkind.

**What can be done ?**

Around the world people are doing extraordinary things everyday in fields such as conservation, carbon capture, renewable energy, and countless other endeavours. This is being done in order to move us from a world reliant on legacy technologies and a way of life that, when operated on the current scale, is destroying vital ecosystems imperative to the functioning of the planet.

However the vast majority of us do not work in these fields, and it is the vast majority that, by their very nature, have the decisive say in how things unfold from here. The adage of “it is only one straw, said a billion people” speaks to what can be done if we come together and engage in things that we can affect. Very few of us have the ability or knowledge to build a solar panel or battery cell. But we all have the ability, and I would argue the duty, to do whatever we can, little or large, to protect this planet, our remarkable home.

**About us**

We aim to be the first conservation crowdfunding platform and planet centric social network.

Pangaea is a vision that I have the following hopes for:

1. There is work being done in the world by conservationists protecting rainforests, oceans, species on the brink of extinction, that often are under-resourced, lack funding, or sometimes people just don’t know they exist. I want these people to share their stories and projects, to make people aware of the vital work they are doing. Soon we'll be adding the ability for them to raise funds via the platform itself, incorporating as Stripe payments system.
1. For many of us who do not have the time but may have resources (big or small) we invite you to donate whatever you can to these projects. The idea is one can either donate to a specific project or to the collective where the money will be distributed to the projects deemed, by you, as the most critical.
1. If we are able to establish early success stories and traffic I would invite any environmentally conscious brands or companies to advertise themselves on our site. If you look at the business models of successful tech networks, they are able to drive millions of dollars of advertising revenue to shareholders. We would transer all of that income to the projects on the site. We want to act as a money generating scheme, driven by the democratic forces of the causes that are the most popular, to provide the financial resources needed to protect the planet.

## Get up and running

**This is currently a work in progress. However due to the time sensitive nature of the problem at large any help, ideas, or PRs would be welcome. See my contact info at tedwards.dev if you would like to get in touch**

**Assumptions:**

- You have Elixir & Erlang installed
- You have Postgres installed and running (optional - see "Using Docker for Postgres" below

**The steps**

1. Clone the repository
1. `mix setup` (this get dependencies, setup database, migrations, seeds, install esbuild + Tailwind)
1. `iex -S mix phx.server` (starts the server in IEX mode)
1. Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Using Docker for Postgres

If your system doesn't have Postgres you can use docker-compose to run it in a container (saves you having to install it).

| Command                                           | Description                                              |
| ------------------------------------------------- | -------------------------------------------------------- |
| `docker compose up`                               | Start in the foreground                                  |
| `docker compose up -d`                            | Start in the background                                  |
| `docker compose down`                             | Stop the containers                                      |
| `docker compose down -v`                          | Stop and delete all Postgres data by removing the volume |
| `docker compose exec db psql --username postgres` | Access through psql                                      |

The connection details for any local clients would be the following:

```
Host: localhost
Port: 5432
User: postgres
Password: postgres
```

If running from Docker Desktop terminal go to Terminal tab

`psql -Upostgres`
`\l` lists available databaes in PSQL server
`\c petal_pro_dev` connects to dev database

`\! clear` clears screen

## Maintaining code quality as you develop

Run `mix quality` to look for issues with your code. This will run each of these tasks:

- `mix format --check-formatted` (formats your code)
- `mix sobelow --config` (security analysis)
- `mix coveralls` (test coverage)
- `mix credo` (code quality)
- `mix recode` (code quality)

If the output is overwhelming, try running one at a time.
