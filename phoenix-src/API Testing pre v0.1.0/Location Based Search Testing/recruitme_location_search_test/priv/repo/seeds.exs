# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RecruitmeLocationSearchTest.Repo.insert!(%RecruitmeLocationSearchTest.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

user_params = [
  %{name: "Coby Benveniste", email: "coby.benveniste@gmail.com", location: %Geo.Point{coordinates: {-87.9074701, 43.0387105}, srid: 4326}},
  %{name: "David Markowitz", email: "david.markowitz@gmail.com", location: %Geo.Point{coordinates: {-87.9082446, 43.0372896}, srid: 4326}},
  %{name: "Maya Gabel", email: "maya.gabel@gmail.com", location: %Geo.Point{coordinates: {-87.9091676, 43.035253}, srid: 4326}},
  %{name: "God", email: "god@gmail.com", location: %Geo.Point{coordinates: {-87.9033059, 43.0020021}, srid: 4326}}
]

Enum.each(user_params, fn(params) ->
  RecruitmeLocationSearchTest.User.changeset(%RecruitmeLocationSearchTest.User{}, params)
  |> RecruitmeLocationSearchTest.Repo.insert!()
end)