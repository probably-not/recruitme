defmodule RecruitmeFullDataModel.Router do
  use RecruitmeFullDataModel.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RecruitmeFullDataModel do
    pipe_through :api
  end
end
