Postgrex.Types.define(
  RecruitmeLocationJsonTest.PostgresTypes,
  [Geo.PostGIS.Extension] ++ Ecto.Adapters.Postgres.extensions(),
  json: Poison
)