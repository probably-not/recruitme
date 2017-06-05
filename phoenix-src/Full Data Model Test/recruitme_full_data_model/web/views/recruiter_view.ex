defmodule RecruitmeFullDataModel.RecruiterView do
  use RecruitmeFullDataModel.Web, :view

  def render("index.json", %{recruiters: recruiters}) do
    %{data: render_many(recruiters, RecruitmeFullDataModel.RecruiterView, "recruiter.json")}
  end

  def render("show.json", %{recruiter: recruiter}) do
    %{data: render_one(recruiter, RecruitmeFullDataModel.RecruiterView, "recruiter.json")}
  end

  def render("recruiter.json", %{recruiter: recruiter}) do
    %{id: recruiter.id,
      user_id: recruiter.user_id}
  end
end
