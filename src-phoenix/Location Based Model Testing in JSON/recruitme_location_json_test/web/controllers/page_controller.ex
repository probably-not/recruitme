defmodule RecruitmeLocationJsonTest.PageController do
  use RecruitmeLocationJsonTest.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
