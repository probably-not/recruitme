defmodule RecruitmeFullDataModel.Router do
  use RecruitmeFullDataModel.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", RecruitmeFullDataModel do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    resources "/jobseekers", JobSeekerController, except: [:new, :edit]
    resources "/recruiters", RecruiterController, except: [:new, :edit]
    resources "/jobs", JobController, except: [:new, :edit]
  end
end
