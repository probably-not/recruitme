defmodule RecruitmeApi.LocationQueryController do
  use RecruitmeApi.Web, :controller

  import Ecto.Query
  import Geo.PostGIS

  alias RecruitmeApi.LocationQuery
  alias RecruitmeApi.Job
  alias RecruitmeApi.JobSeeker

  # Find all Jobs withing a radius in meters
  def jobs_within_radius(conn, %{"search" => search_params}) do
    changeset = LocationQuery.changeset(%LocationQuery{}, search_params)
    if changeset.valid? do
      point2 = %Geo.Point{coordinates: {search_params["longitude"], search_params["latitude"]}, srid: 4326}
      query = from job in Job, where: st_distance(job.location, ^point2)  < ^search_params["radius"],  select: job
      jobs = Repo.all(query)
      render(conn, "job_search_results.json", jobs: jobs)
    else
      conn
        |> put_status(:unprocessable_entity)
        |> render(RecruitmeApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  # Find all JobSeekers withing a radius in meters
  def job_seekers_within_radius(conn, %{"search" => search_params}) do
    changeset = LocationQuery.changeset(%LocationQuery{}, search_params)
    if changeset.valid? do
      point2 = %Geo.Point{coordinates: {search_params["longitude"], search_params["latitude"]}, srid: 4326}
      query = from job_seeker in JobSeeker, where: st_distance(job_seeker.location, ^point2)  < ^search_params["radius"],  select: job_seeker
      jobseekers = Repo.all(query) |> Repo.preload([:user])
      render(conn, "job_seeker_search_results.json", jobseekers: jobseekers)
    else
      conn
        |> put_status(:unprocessable_entity)
        |> render(RecruitmeApi.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
