defmodule RecruitmeLocationJsonTest.UserView do
  use RecruitmeLocationJsonTest.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, RecruitmeLocationJsonTest.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, RecruitmeLocationJsonTest.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      email: user.email,
      location: user.location}
  end
end
