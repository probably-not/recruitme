defmodule RecruitmeApi.Router do
  use RecruitmeApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", RecruitmeApi do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    resources "/jobseekers", JobSeekerController, except: [:new, :edit]
    resources "/recruiters", RecruiterController, except: [:new, :edit, :update]
    resources "/jobs", JobController, except: [:new, :edit]

    # JSON REST Routes for Searching
    post "/search/jobs", LocationQueryController, :jobs_within_radius
    post "/search/jobseekers", LocationQueryController, :job_seekers_within_radius

  end
end
