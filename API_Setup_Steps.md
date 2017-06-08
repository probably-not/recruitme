# API Setup Steps

Until version 1.0 of the API, versioning is being done by creating a new Phoenix project for each milestone. The following steps need to be taken to create the API before moving on to the next milestone.

## Setup Steps

- `mix phoenix.new recruitme_api --no-brunch --no-html` to create the new Phoenix project with no brunch.io files and no html files
- Add `{:geo, "~> 1.0"}, {:cors_plug, "~> 1.2"}, {:comeonin, "~> 3.0"}` to your `mix.exs` deps
- Add `:comeonin` to your `mix.exs` application block
- Add `plug CORSPlug` to the `endpoint.ex` file, before the line `plug RecruitmeApi.Router`
- Add a new file to `lib/recruitme_api/` called `postgres_types.ex`

**postgres_types.ex**

```elixir
Postgrex.Types.define(
  RecruitmeApi.PostgresTypes,
  [Geo.PostGIS.Extension] ++ Ecto.Adapters.Postgres.extensions(),
  json: Poison
)
```

- In your `dev.exs`, `prod.secret.exs`, and `test.exs` files, add the line `types: RecruitmeApi.PostgresTypes` after the `adapter` line under the `config` block for the database
- `mix ecto.gen.migration enable_postgis` to create a migration that enables postgis on migrate

**{{timestamp}}enable_postgis.ex**

```elixir
defmodule RecruitmeApi.Repo.Migrations.EnablePostgis do
  use Ecto.Migration

  def up do
    execute "CREATE EXTENSION IF NOT EXISTS postgis"
  end

  def down do
    execute "DROP EXTENSION IF EXISTS postgis"
  end
end
```

- Add your models, make sure all of the associations are set up, change the `location` field to a `%Geo.Point{}` field in your models and to a `:geography` field in your migrations, make sure we have `null: false` and `delete_all` in the correct places in migrations.
- `mix phoenix.gen.json --no-migration LocationQuery locationqueries` to generate the LocationQuery model and controller with no migration
- Edit your changesets in all models to reflect the validations *(get these from the old project)*
- Edit your controllers to reflect the current necessary routes *(get these from the old project)*
- Edit your views to reflect the current necessary views  *(get these from the old project)*
- Ensure that the API is working as the old version does before moving on to the next milestone