defmodule RecruitmeApi.JobSeekerView do
  use RecruitmeApi.Web, :view

  def render("index.json", %{jobseekers: jobseekers}) do
    %{data: render_many(jobseekers, RecruitmeApi.JobSeekerView, "job_seeker.json")}
  end

  def render("show.json", %{job_seeker: job_seeker}) do
    %{data: render_one(job_seeker, RecruitmeApi.JobSeekerView, "job_seeker.json")}
  end

  def render("deleted.json", %{job_seeker: job_seeker}) do
    %{deleted: render_one(job_seeker, RecruitmeApi.JobSeekerView, "job_seeker.json")}
  end

  def render("job_seeker.json", %{job_seeker: job_seeker}) do
    %{id: job_seeker.id,
      skills: job_seeker.skills,
      education_level: job_seeker.education_level,
      latitude: job_seeker.latitude,
      longitude: job_seeker.longitude}
      #user_id: job_seeker.user_id,
      #user_name: job_seeker.user.name,
      #user_email: job_seeker.user.email}
  end
end
