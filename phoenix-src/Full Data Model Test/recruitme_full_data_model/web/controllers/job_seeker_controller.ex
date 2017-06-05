defmodule RecruitmeFullDataModel.JobSeekerController do
  use RecruitmeFullDataModel.Web, :controller

  alias RecruitmeFullDataModel.JobSeeker

  def index(conn, _params) do
    jobseekers = Repo.all(JobSeeker)
    render(conn, "index.json", jobseekers: jobseekers)
  end

  def create(conn, %{"job_seeker" => job_seeker_params}) do
    changeset = JobSeeker.changeset(%JobSeeker{}, job_seeker_params)

    case Repo.insert(changeset) do
      {:ok, job_seeker} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", job_seeker_path(conn, :show, job_seeker))
        |> render("show.json", job_seeker: job_seeker)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(RecruitmeFullDataModel.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    job_seeker = Repo.get!(JobSeeker, id)
    render(conn, "show.json", job_seeker: job_seeker)
  end

  def update(conn, %{"id" => id, "job_seeker" => job_seeker_params}) do
    job_seeker = Repo.get!(JobSeeker, id)
    changeset = JobSeeker.changeset(job_seeker, job_seeker_params)

    case Repo.update(changeset) do
      {:ok, job_seeker} ->
        render(conn, "show.json", job_seeker: job_seeker)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(RecruitmeFullDataModel.ChangesetView, "error.json", changeset: changeset)
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
