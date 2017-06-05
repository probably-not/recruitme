defmodule RecruitmeLocationJsonTest.LocationQueryView do
  use RecruitmeLocationJsonTest.Web, :view

  def render("job_search_results.json", %{jobs: jobs}) do
    %{search_results: render_many(jobs, RecruitmeLocationJsonTest.JobView, "job.json")}
  end

  def render("user_search_results.json", %{users: users}) do
    %{search_results: render_many(users, RecruitmeLocationJsonTest.UserView, "user.json")}
  end

end
