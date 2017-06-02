defmodule RecruitmeApiTest.JobController do
  use RecruitmeApiTest.Web, :controller

  # Private Function
  # Generate a connection with a not found status so that if we have a resource that is not available we will get a 404 not found
  defp conn_with_status(conn, nil) do
  	conn
  		|> put_status(:not_found)
  end

  # Private Function
  # Generate a connection with an ok status so that when we have a resource that is ok then it will give an ok status
  defp conn_with_status(conn, _) do
  	conn
  		|> put_status(:ok)
  end

  # Get the entire index of Jobs
  def index(conn, _params) do
  	jobs = Repo.all(RecruitmeApiTest.Job)
  	json conn_with_status(conn, jobs), jobs
  end

  # Get a specific job by ID
  def show(conn, %{"id" => id}) do
  	job = Repo.get(RecruitmeApiTest.Job, String.to_integer(id))
  	json conn_with_status(conn, job), job
  end

  # Create a job with the specified parameters
  def create(conn, params) do
  	changeset = RecruitmeApiTest.Job.changeset(%RecruitmeApiTest.Job{}, params)
  	case Repo.insert(changeset) do
  	   {:ok, job} -> json conn |> put_status(:created), job
  	   {:error, _changeset} -> json conn |> put_status(:bad_request), %{errors: ["Unable To Create Job"] }
  	end

  	json conn, nil
  end

  # Update a specific job's parameters
  def update(conn, %{"id" => id} = params) do
  	job = Repo.get(RecruitmeApiTest.Job, String.to_integer(id))
  	if job do
  		perform_update(conn, job, params)
  	else
  		json conn |> put_status(:not_found), %{errors: ["Job Not Found"] }
  	end
  end

  # Private Function
  # Perform the update on a specified job's parameters
  defp perform_update(conn, job, params) do
  	changeset = RecruitmeApiTest.Job.changeset(job, params)
	case Repo.update(changeset) do
		{:ok, job} -> json conn |> put_status(:ok), job
		{:error, _changeset} -> json conn |> put_status(:bad_request), %{errors: ["Unable To Update Job Posting"] }
	end
  end

  # Delete a specific job
  def delete(conn, %{"id" => id}) do
  	job = Repo.get(RecruitmeApiTest.Job, String.to_integer(id))
  	if job do
  		perform_delete(conn, job)
  	else
  		json conn |> put_status(:not_found), %{errors: ["Job Not Found"] }
  	end
  end

  # Private Function
  # Perform the delete on a specified job
  defp perform_delete(conn, job) do
  	case Repo.delete(job) do
  		{:ok, job} -> json conn |> put_status(:ok), %{acknowledged: ["Job Posting Deleted"] }
  		{:error, _job} -> json conn |> put_status(:bad_request), %{errors: ["Unable To Delete Job Posting"] }
  	end
  end

  # Delete all jobs
  def delete_all(conn, _params) do
    jobs = Repo.all(RecruitmeApiTest.Job)
    Enum.each(jobs, fn(job) -> Repo.delete(job) end)
    json conn |> put_status(:ok), %{acknowledged: ["All Job Postings Deleted"] }
  end

end
