defmodule RecruitmeApiTest.PageController do
  use RecruitmeApiTest.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
