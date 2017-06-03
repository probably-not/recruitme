Postgrex.Types.define(
  RecruitmeLocationTest.PostgresTypes,
  [Geo.PostGIS.Extension] ++ Ecto.Adapters.Postgres.extensions(),
  json: Poison
)