defmodule RecruitmeApiTest.Router do
  use RecruitmeApiTest.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/", RecruitmeApiTest do
  #   pipe_through :browser # Use the default browser stack

  #   get "/", PageController, :index
  # end

  scope "/api/v1", RecruitmeApiTest do
    pipe_through :api

    # Jobs REST Routes
    get "/jobs", JobController, :index
    get "/jobs/:id", JobController, :show
    post "/jobs", JobController, :create
    put "/jobs/:id", JobController, :update
    delete "/jobs/:id", JobController, :delete
    delete "/jobs/_all", JobController, :delete_all

    
  end
end
