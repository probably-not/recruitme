defmodule RecruitmeApi.JobSeekerController do
  use RecruitmeApi.Web, :controller

  alias RecruitmeApi.JobSeeker
  alias RecruitmeApi.User

  def index(conn, _params) do
    jobseekers = Repo.all(JobSeeker) |> Repo.preload([:user])
    render(conn, "index.json", jobseekers: jobseekers)
  end

  def create(conn, %{"job_seeker" => job_seeker_params}) do
    location_point = %{"location" => %Geo.Point{coordinates: {job_seeker_params["longitude"], job_seeker_params["latitude"]}, srid: 4326}}
    user = %{"user" => Repo.get(User, job_seeker_params["user_id"])}
    new_job_seeker_params = Map.merge(Map.merge(job_seeker_params, location_point), user)

    changeset = JobSeeker.changeset(%JobSeeker{}, new_job_seeker_params)

    case Repo.insert(changeset) do
      {:ok, job_seeker} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", job_seeker_path(conn, :show, job_seeker))
        |> render("show.json", job_seeker: Repo.get!(JobSeeker, job_seeker.id) |> Repo.preload([:user]))
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(RecruitmeApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    job_seeker = Repo.get!(JobSeeker, id) |> Repo.preload([:user])
    render(conn, "show.json", job_seeker: job_seeker)
  end

  def update(conn, %{"id" => id, "job_seeker" => job_seeker_params}) do
    location_point = %{"location" => %Geo.Point{coordinates: {job_seeker_params["longitude"], job_seeker_params["latitude"]}, srid: 4326}}
    user = %{"user" => Repo.get(User, job_seeker_params["user_id"])}
    new_job_seeker_params = Map.merge(Map.merge(job_seeker_params, location_point), user)
    job_seeker = Repo.get!(JobSeeker, id) |> Repo.preload([:user])

    changeset = JobSeeker.changeset(job_seeker, new_job_seeker_params)

    case Repo.update(changeset) do
      {:ok, job_seeker} ->
        render(conn, "show.json", job_seeker: Repo.get!(JobSeeker, job_seeker.id) |> Repo.preload([:user]))
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(RecruitmeApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    job_seeker = Repo.get!(JobSeeker, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(job_seeker)

    send_resp(conn, :no_content, "")
  end
end
