defmodule RecruitmeApi.LocationQueryControllerTest do
  use RecruitmeApi.ConnCase

  @valid_attrs %{latitude: "120.5", longitude: "120.5", radius: 1000.0}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "finds all jobs in a radius in meters when data is valid", %{conn: conn} do
    conn = post conn, location_query_path(conn, :jobs_within_radius), search: @valid_attrs
    assert json_response(conn, 200)["search_results"]
  end

  test "finds all jobseekers in a radius in meters when data is valid", %{conn: conn} do
    conn = post conn, location_query_path(conn, :job_seekers_within_radius), search: @valid_attrs
    assert json_response(conn, 200)["search_results"]
  end

end
