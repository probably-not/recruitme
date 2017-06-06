defmodule RecruitmeFullDataModel.JobView do
  use RecruitmeFullDataModel.Web, :view

  def render("index.json", %{jobs: jobs}) do
    %{data: render_many(jobs, RecruitmeFullDataModel.JobView, "job.json")}
  end

  def render("show.json", %{job: job}) do
    %{data: render_one(job, RecruitmeFullDataModel.JobView, "job.json")}
  end

  def render("job.json", %{job: job}) do
    %{id: job.id,
      recruiter_id: job.recruiter_id,
      title: job.title,
      description: job.description,
      company: job.company,
      skills: job.skills,
      education_level: job.education_level,
      latitude: job.latitude,
      longitude: job.longitude,
      recruiter: render_one(job.recruiter, RecruitmeFullDataModel.RecruiterView, "recruiter.json")}
  end
end
