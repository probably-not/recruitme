defmodule RecruitmeFullDataModel.JobSeekerView do
  use RecruitmeFullDataModel.Web, :view

  def render("index.json", %{jobseekers: jobseekers}) do
    %{data: render_many(jobseekers, RecruitmeFullDataModel.JobSeekerView, "job_seeker.json")}
  end

  def render("show.json", %{job_seeker: job_seeker}) do
    %{data: render_one(job_seeker, RecruitmeFullDataModel.JobSeekerView, "job_seeker.json")}
  end

  def render("job_seeker.json", %{job_seeker: job_seeker}) do
    %{id: job_seeker.id,
      user_id: job_seeker.user_id,
      skills: job_seeker.skills,
      education_level: job_seeker.education_level,
      latitude: job_seeker.latitude,
      longitude: job_seeker.longitude,
      user: render_one(job_seeker.user, RecruitmeFullDataModel.UserView, "user.json")}
  end
end
