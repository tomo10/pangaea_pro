<p align="center">
  <img src="/priv/static/images/logo_for_emails.png" height="128">

  <p align="center">
    Join us on preserving the natural world
  </p>
</p>

<p align="center">
  <a href="https://docs.petal.build">DOCS</a>
</p>

## Manifesto

In the relatively short time that humans have been the dominant species on this planet, the natural world has seen enormous suffering. By acting with scant regard for the natural world we have pushed animals to extinction and our rainforests and other biodiverse regions to the brink. This has profound implications for the future of our planet and the millions of species that call it home.

As a planet of 7bn people we have struggled to gather the collective wisdom, garner the will, in order to coordinate and prevent the attrocities that are befalling our natural world on a daily basis. This has severe implications not only for the regions that we call home and the animals that share it with, but also for us. If, like me, you wonder are we fighting for our own futures, for theirs, or for the futures of every living thing on this planet, the fact is a world that is less biodiverse is a poorer one for all.

What can be done?

## Get up and running

**Assumptions:**

- You have Elixir & Erlang installed
- You have Postgres installed and running (optional - see "Using Docker for Postgres" below

If you don't meet this assumptions you can read our [comprehensive install instructions](https://docs.petal.build/petal-pro-documentation/fundamentals/installation).

**The steps**

1. Add the "petal" repo so your local Hex is aware of our private packages. Simply run the command in step 1 in the ["Install Petal Framework"](https://petal.build/components/install-petal-framework) guide (make sure you're signed in so your license key is automatically insterted).
1. `mix setup` (this get dependencies, setup database, migrations, seeds, install esbuild + Tailwind)
1. `iex -S mix phx.server` (starts the server in IEX mode)
1. Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

**Moving forward:**

- Do a global search for `SETUP_TODO` and follow the instructions to mold the boilerplate to your brand
- Optional: Follow our tutorial ["Creating a web app from start to finish"](https://docs.petal.build/petal-pro-documentation/guides/creating-a-web-app-from-start-to-finish) to get an overview of Petal Pro

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

## Renaming

Uses the `rename_project` lib to rename the project.

Run `mix rename CurrentName NewName`.

For example:

```
mix rename PetalPro MyTwitterClone
```

Then you can delete the `rename_project` lib from your `mix.exs` and run `mix clean_mix_lock` to fully remove it from your deps folder.

Note that it is not recommended to rename the project if you wish to keep pulling in Petal Pro updates. This is because it can be much harder to update after you have renamed. [Here is a guide](https://docs.saaspegasus.com/upgrading.html#using-branches-recommended) on how to keep up to date based on a similar framework in Python.

## Maintaining code quality as you develop

Run `mix quality` to look for issues with your code. This will run each of these tasks:

- `mix format --check-formatted` (formats your code)
- `mix sobelow --config` (security analysis)
- `mix coveralls` (test coverage)
- `mix credo` (code quality)
- `mix recode` (code quality)

If the output is overwhelming, try running one at a time.

## Contributing

Petal Pro is a paid product but we welcome PR's if you find small bugs / typos / improvements. Let us know if you want to contribute in a more significant way and we can offer unlimited membership in return.
