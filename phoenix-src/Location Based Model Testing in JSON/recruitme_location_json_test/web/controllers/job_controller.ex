defmodule RecruitmeLocationJsonTest.JobController do
  use RecruitmeLocationJsonTest.Web, :controller

  require Logger

  import Ecto.Query
  import Geo.PostGIS

  alias RecruitmeLocationJsonTest.Job

  def index(conn, _params) do
    jobs = Repo.all(Job)
    render(conn, "index.json", jobs: jobs)
  end

  def create(conn, %{"job" => job_params}) do
    location_point = %{"location" => %Geo.Point{coordinates: {job_params["longitude"], job_params["latitude"]}, srid: 4326}}
    new_job_params = Map.merge(job_params, location_point)
    changeset = Job.changeset(%Job{}, new_job_params)

    case Repo.insert(changeset) do
      {:ok, job} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", job_path(conn, :show, job))
        |> render("show.json", job: job)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(RecruitmeLocationJsonTest.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    job = Repo.get(Job, id)
    render(conn, "show.json", job: job)
  end

  def update(conn, %{"id" => id, "job" => job_params}) do
    location_point = %{"location" => %Geo.Point{coordinates: {job_params["longitude"], job_params["latitude"]}, srid: 4326}}
    new_job_params = Map.merge(job_params, location_point)
    job = Repo.get(Job, id)
    changeset = Job.changeset(job, new_job_params)

    case Repo.update(changeset) do
      {:ok, job} ->
        render(conn, "show.json", job: job)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(RecruitmeLocationJsonTest.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    job = Repo.get!(Job, id)
    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(job)
    render(conn, "deleted.json", job: job)
  end

  # Delete all jobs
  def delete_all(conn, _params) do
    jobs = Repo.all(RecruitmeLocationJsonTest.Job)
    Enum.each(jobs, fn(job) -> Repo.delete!(job) end)
    render(conn, "deleted_all.json", jobs: jobs)
  end

  # Find all Jobs withing a radius in meters
  def within(conn, %{"search" => search_params}) do
    point2 = %Geo.Point{coordinates: {search_params["longitude"], search_params["latitude"]}, srid: 4326}
    query = from job in Job, where: st_distance(job.location, ^point2)  < ^search_params["radius"],  select: job
    jobs = Repo.all(query)
    render(conn, "search_results.json", jobs: jobs)
  end


end
