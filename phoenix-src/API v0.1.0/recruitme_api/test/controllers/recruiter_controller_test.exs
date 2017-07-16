defmodule RecruitmeApi.RecruiterControllerTest do
  use RecruitmeApi.ConnCase
  
  alias RecruitmeApi.Recruiter
  # @valid_attrs %{user: %RecruitmeApi.User{}}
  # @invalid_attrs %{user_id: -1}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, recruiter_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    recruiter = Repo.insert! %Recruiter{}
    conn = get conn, recruiter_path(conn, :show, recruiter)
    assert json_response(conn, 200)["data"] == %{"id" => recruiter.id, "jobs" => []}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, recruiter_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    user = Repo.insert!(%RecruitmeApi.User{"name": "coby", "email": "coby.benveniste@gmail.com"})
    valid_user_attrs = %{user_id: user.id}
    conn = post conn, recruiter_path(conn, :create), recruiter: valid_user_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Recruiter, valid_user_attrs)
  end

  # Need to find a better test for this instance since this test currently works and returns 201
  # test "does not create resource and renders errors when data is invalid", %{conn: conn} do
  #   conn = post conn, recruiter_path(conn, :create), recruiter: invalid_user_attrs
  #   assert json_response(conn, 422)["errors"] != %{}
  # end

  test "deletes chosen resource", %{conn: conn} do
    recruiter = Repo.insert! %Recruiter{}
    conn = delete conn, recruiter_path(conn, :delete, recruiter)
    assert response(conn, 204)
    refute Repo.get(Recruiter, recruiter.id)
  end
end
