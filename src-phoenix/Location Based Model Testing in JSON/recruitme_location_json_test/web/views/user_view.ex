defmodule RecruitmeLocationJsonTest.UserView do
  use RecruitmeLocationJsonTest.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, RecruitmeLocationJsonTest.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, RecruitmeLocationJsonTest.UserView, "user.json")}
  end

  def render("deleted.json", %{user: user}) do
    %{deleted: render_one(user, RecruitmeLocationJsonTest.UserView, "user.json")}
  end

  def render("search_results.json", %{users: users}) do
    %{data: render_many(users, RecruitmeLocationJsonTest.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      email: user.email,
      latitude: user.latitude,
      longitude: user.longitude}
  end

end