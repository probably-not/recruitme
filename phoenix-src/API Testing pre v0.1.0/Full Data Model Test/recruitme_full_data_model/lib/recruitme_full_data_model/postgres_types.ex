Postgrex.Types.define(
  RecruitmeFullDataModel.PostgresTypes,
  [Geo.PostGIS.Extension] ++ Ecto.Adapters.Postgres.extensions(),
  json: Poison
)