defmodule RecruitmeApi.LocationQueryView do
  use RecruitmeApi.Web, :view

  def render("job_search_results.json", %{jobs: jobs}) do
    %{search_results: render_many(jobs, RecruitmeApi.JobView, "job_small.json")}
  end

  def render("job_seeker_search_results.json", %{jobseekers: jobseekers}) do
    %{search_results: render_many(jobseekers, RecruitmeApi.JobSeekerView, "job_seeker.json")}
  end

  def render("location_query_error.json", %{errors: errors}) do
    %{errors: render_many(errors, RecruitmeApi.LocationQueryView, "error.json")}
  end

  def render("error.json", %{error: error}) do
    %{error: error}
  end

end
