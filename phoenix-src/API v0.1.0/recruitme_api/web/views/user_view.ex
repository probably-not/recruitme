defmodule RecruitmeApi.UserView do
  use RecruitmeApi.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, RecruitmeApi.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, RecruitmeApi.UserView, "user.json")}
  end

  def render("deleted.json", %{user: user}) do
    %{deleted: render_one(user, RecruitmeApi.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      email: user.email}
  end
end
