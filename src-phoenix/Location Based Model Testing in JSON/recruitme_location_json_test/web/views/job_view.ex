defmodule RecruitmeLocationJsonTest.JobView do
  use RecruitmeLocationJsonTest.Web, :view

  def render("index.json", %{jobs: jobs}) do
    %{data: render_many(jobs, RecruitmeLocationJsonTest.JobView, "job.json")}
  end

  def render("show.json", %{job: job}) do
    %{data: render_one(job, RecruitmeLocationJsonTest.JobView, "job.json")}
  end

  def render("deleted.json", %{job: job}) do
    %{deleted: render_one(job, RecruitmeLocationJsonTest.JobView, "job.json")}
  end

  def render("deleted_all.json", %{jobs: jobs}) do
    %{deleted: render_many(jobs, RecruitmeLocationJsonTest.JobView, "job.json")}
  end

  def render("search_results.json", %{jobs: jobs}) do
    %{data: render_many(jobs, RecruitmeLocationJsonTest.JobView, "job.json")}
  end

  def render("job.json", %{job: job}) do
    %{id: job.id,
      title: job.title,
      description: job.description,
      company: job.company,
      latitude: job.latitude,
      longitude: job.longitude}
  end
end
