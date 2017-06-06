defmodule RecruitmeFullDataModel.JobController do
  use RecruitmeFullDataModel.Web, :controller

  alias RecruitmeFullDataModel.Job
  alias RecruitmeFullDataModel.Recruiter

  def index(conn, _params) do
    jobs = Repo.all(Job) |> Repo.preload([recruiter: :user])
    render(conn, "index.json", jobs: jobs)
  end

  def create(conn, %{"job" => job_params}) do
    location_point = %{"location" => %Geo.Point{coordinates: {job_params["longitude"], job_params["latitude"]}, srid: 4326}}
    recruiter = %{"recruiter" => Repo.get(Recruiter, job_params["recruiter_id"])}
    new_job_params = Map.merge(Map.merge(job_params, location_point), recruiter)

    changeset = Job.changeset(%Job{}, new_job_params)

    case Repo.insert(changeset) do
      {:ok, job} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", job_path(conn, :show, job))
        |> render("show.json", job: Repo.get!(Job, job.id) |> Repo.preload([recruiter: :user]))
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(RecruitmeFullDataModel.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    job = Repo.get!(Job, id) |> Repo.preload([:recruiter])
    render(conn, "show.json", job: job)
  end

  def update(conn, %{"id" => id, "job" => job_params}) do
    location_point = %{"location" => %Geo.Point{coordinates: {job_params["longitude"], job_params["latitude"]}, srid: 4326}}
    recruiter = %{"recruiter" => Repo.get(Recruiter, job_params["recruiter_id"])}
    new_job_params = Map.merge(Map.merge(job_params, location_point), recruiter)

    job = Repo.get!(Job, id) |> Repo.preload([recruiter: :user])
    changeset = Job.changeset(job, new_job_params)

    case Repo.update(changeset) do
      {:ok, job} ->
        render(conn, "show.json", job: Repo.get!(Job, job.id) |> Repo.preload([recruiter: :user]))
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(RecruitmeFullDataModel.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    job = Repo.get!(Job, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(job)

    send_resp(conn, :no_content, "")
  end
end
