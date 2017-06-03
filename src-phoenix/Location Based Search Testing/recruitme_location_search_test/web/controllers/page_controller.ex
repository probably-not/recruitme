defmodule RecruitmeLocationSearchTest.PageController do
  use RecruitmeLocationSearchTest.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
