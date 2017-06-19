defmodule RecruitmeApi.RecruiterView do
  use RecruitmeApi.Web, :view

  def render("index.json", %{recruiters: recruiters}) do
    %{data: render_many(recruiters, RecruitmeApi.RecruiterView, "recruiter.json")}
  end

  def render("show.json", %{recruiter: recruiter}) do
    %{data: render_one(recruiter, RecruitmeApi.RecruiterView, "recruiter.json")}
  end

  def render("deleted.json", %{recruiter: recruiter}) do
    %{deleted: render_one(recruiter, RecruitmeApi.RecruiterView, "recruiter.json")}
  end

  def render("recruiter.json", %{recruiter: recruiter}) do
    %{id: recruiter.id,
      #user_id: recruiter.user_id,
      #user_name: recruiter.user.name,
      #user_email: recruiter.user.email,
      jobs: render_many(recruiter.jobs, RecruitmeApi.JobView, "job_small.json")}
  end
end
