defmodule RecruitmeFullDataModel.JobsControllerTest do
  use RecruitmeFullDataModel.ConnCase

  alias RecruitmeFullDataModel.Jobs
  @valid_attrs %{company: "some content", description: "some content", education_level: "some content", latitude: "120.5", location: "some content", longitude: "120.5", skills: [], title: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, jobs_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    jobs = Repo.insert! %Jobs{}
    conn = get conn, jobs_path(conn, :show, jobs)
    assert json_response(conn, 200)["data"] == %{"id" => jobs.id,
      "recruiter_id" => jobs.recruiter_id,
      "title" => jobs.title,
      "description" => jobs.description,
      "company" => jobs.company,
      "skills" => jobs.skills,
      "education_level" => jobs.education_level,
      "location" => jobs.location,
      "latitude" => jobs.latitude,
      "longitude" => jobs.longitude}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, jobs_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, jobs_path(conn, :create), jobs: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Jobs, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, jobs_path(conn, :create), jobs: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    jobs = Repo.insert! %Jobs{}
    conn = put conn, jobs_path(conn, :update, jobs), jobs: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Jobs, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    jobs = Repo.insert! %Jobs{}
    conn = put conn, jobs_path(conn, :update, jobs), jobs: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    jobs = Repo.insert! %Jobs{}
    conn = delete conn, jobs_path(conn, :delete, jobs)
    assert response(conn, 204)
    refute Repo.get(Jobs, jobs.id)
  end
end
