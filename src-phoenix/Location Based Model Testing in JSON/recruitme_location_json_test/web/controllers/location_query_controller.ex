defmodule RecruitmeLocationJsonTest.LocationQueryController do
  use RecruitmeLocationJsonTest.Web, :controller

  require Logger

  import Ecto.Query
  import Geo.PostGIS

  alias RecruitmeLocationJsonTest.Job
  alias RecruitmeLocationJsonTest.User

  # Find all Jobs withing a radius in meters
  def jobs_within_radius(conn, %{"search" => search_params}) do
    point2 = %Geo.Point{coordinates: {search_params["longitude"], search_params["latitude"]}, srid: 4326}
    query = from job in Job, where: st_distance(job.location, ^point2)  < ^search_params["radius"],  select: job
    jobs = Repo.all(query)
    render(conn, "job_search_results.json", jobs: jobs)
  end

  # Find all Users withing a radius in meters
  def users_within_radius(conn, %{"search" => search_params}) do
    point2 = %Geo.Point{coordinates: {search_params["longitude"], search_params["latitude"]}, srid: 4326}
    query = from user in User, where: st_distance(user.location, ^point2)  < ^search_params["radius"],  select: user
    users = Repo.all(query)
    render(conn, "user_search_results.json", users: users)
  end


end
