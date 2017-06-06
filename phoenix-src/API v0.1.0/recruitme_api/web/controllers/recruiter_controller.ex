defmodule RecruitmeApi.RecruiterController do
  use RecruitmeApi.Web, :controller

  alias RecruitmeApi.Recruiter
  alias RecruitmeApi.User

  def index(conn, _params) do
    recruiters = Repo.all(Recruiter) |> Repo.preload([:user]) |> Repo.preload([:jobs])
    render(conn, "index.json", recruiters: recruiters)
  end

  def create(conn, %{"recruiter" => recruiter_params}) do
    user = %{"user" => Repo.get(User, recruiter_params["user_id"])}
    new_recruiter_params = Map.merge(recruiter_params, user)
    changeset = Recruiter.changeset(%Recruiter{}, new_recruiter_params)

    case Repo.insert(changeset) do
      {:ok, recruiter} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", recruiter_path(conn, :show, recruiter))
        |> render("show.json", recruiter: Repo.get!(Recruiter, recruiter.id) |> Repo.preload([:user]) |> Repo.preload([:jobs]))
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(RecruitmeApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    recruiter = Repo.get!(Recruiter, id) |> Repo.preload([:user]) |> Repo.preload([:jobs])
    render(conn, "show.json", recruiter: recruiter)
  end

  def update(conn, %{"id" => id, "recruiter" => recruiter_params}) do
    user = %{"user" => Repo.get(User, recruiter_params["user_id"])}
    new_recruiter_params = Map.merge(recruiter_params, user)
    recruiter = Repo.get!(Recruiter, id) |> Repo.preload([:user])
    changeset = Recruiter.changeset(recruiter, new_recruiter_params)

    case Repo.update(changeset) do
      {:ok, recruiter} ->
        render(conn, "show.json", recruiter: Repo.get!(Recruiter, recruiter.id) |> Repo.preload([:user]) |> Repo.preload([:jobs]))
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(RecruitmeApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    recruiter = Repo.get!(Recruiter, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(recruiter)

    send_resp(conn, :no_content, "")
  end
end
