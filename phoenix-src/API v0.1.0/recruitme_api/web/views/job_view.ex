defmodule RecruitmeApi.JobView do
  use RecruitmeApi.Web, :view

  def render("index.json", %{jobs: jobs}) do
    %{data: render_many(jobs, RecruitmeApi.JobView, "job.json")}
  end

  def render("show.json", %{job: job}) do
    %{data: render_one(job, RecruitmeApi.JobView, "job.json")}
  end

  def render("deleted.json", %{job: job}) do
    %{deleted: render_one(job, RecruitmeApi.JobView, "job.json")}
  end

  def render("job.json", %{job: job}) do
    %{id: job.id,
      title: job.title,
      description: job.description,
      company: job.company,
      skills: job.skills,
      education_level: job.education_level,
      latitude: job.latitude,
      longitude: job.longitude,
      recruiter_id: job.recruiter_id,
      recruiter_name: job.recruiter.user.name,
      recruiter_email: job.recruiter.user.email}
  end

  def render("job_small.json", %{job: job}) do
    %{id: job.id,
      title: job.title,
      description: job.description,
      company: job.company,
      skills: job.skills,
      education_level: job.education_level,
      latitude: job.latitude,
      longitude: job.longitude}
  end

end
