defmodule RecruitmeLocationJsonTest.UserController do
  use RecruitmeLocationJsonTest.Web, :controller

  require Logger

  import Ecto.Query
  import Geo.PostGIS

  alias RecruitmeLocationJsonTest.User

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    location_point = %{"location" => %Geo.Point{coordinates: {user_params["longitude"], user_params["latitude"]}, srid: 4326}}
    new_user_params = Map.merge(user_params, location_point)
    changeset = User.changeset(%User{}, new_user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", user_path(conn, :show, user))
        |> render("show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(RecruitmeLocationJsonTest.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(User, id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    location_point = %{"location" => %Geo.Point{coordinates: {user_params["longitude"], user_params["latitude"]}, srid: 4326}}
    new_user_params = Map.merge(user_params, location_point)
    user = Repo.get(User, id)
    changeset = User.changeset(user, new_user_params)

    case Repo.update(changeset) do
      {:ok, user} ->
        render(conn, "show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(RecruitmeLocationJsonTest.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user)
    render(conn, "deleted.json", user: user)
  end

  # Find all Users withing a radius in meters
  def within(conn, %{"search" => search_params}) do
    point2 = %Geo.Point{coordinates: {search_params["longitude"], search_params["latitude"]}, srid: 4326}
    query = from user in User, where: st_distance(user.location, ^point2)  < ^search_params["radius"],  select: user
    users = Repo.all(query)
    render(conn, "search_results.json", users: users)
  end

end