defmodule RecruitmeApi.Router do
  use RecruitmeApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RecruitmeApi do
    pipe_through :api
  end
end
