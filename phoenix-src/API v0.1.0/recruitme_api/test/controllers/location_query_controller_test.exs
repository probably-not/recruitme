defmodule RecruitmeApi.LocationQueryControllerTest do
  use RecruitmeApi.ConnCase

  alias RecruitmeApi.LocationQuery
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, location_query_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    location_query = Repo.insert! %LocationQuery{}
    conn = get conn, location_query_path(conn, :show, location_query)
    assert json_response(conn, 200)["data"] == %{"id" => location_query.id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, location_query_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, location_query_path(conn, :create), location_query: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(LocationQuery, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, location_query_path(conn, :create), location_query: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    location_query = Repo.insert! %LocationQuery{}
    conn = put conn, location_query_path(conn, :update, location_query), location_query: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(LocationQuery, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    location_query = Repo.insert! %LocationQuery{}
    conn = put conn, location_query_path(conn, :update, location_query), location_query: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    location_query = Repo.insert! %LocationQuery{}
    conn = delete conn, location_query_path(conn, :delete, location_query)
    assert response(conn, 204)
    refute Repo.get(LocationQuery, location_query.id)
  end
end
