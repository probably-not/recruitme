Postgrex.Types.define(
  RecruitmeLocationSearchTest.PostgresTypes,
  [Geo.PostGIS.Extension] ++ Ecto.Adapters.Postgres.extensions(),
  json: Poison
)