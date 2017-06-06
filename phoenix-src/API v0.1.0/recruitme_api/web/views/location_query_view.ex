defmodule RecruitmeApi.LocationQueryView do
  use RecruitmeApi.Web, :view

  def render("job_search_results.json", %{jobs: jobs}) do
    %{search_results: render_many(jobs, RecruitmeApi.JobView, "job_small.json")}
  end

  def render("job_seeker_search_results.json", %{jobseekers: jobseekers}) do
    %{search_results: render_many(jobseekers, RecruitmeApi.JobSeekerView, "job_seeker.json")}
  end

end
