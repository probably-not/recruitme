defmodule RecruitmeApi.JobTest do
  use RecruitmeApi.ModelCase

  alias RecruitmeApi.Job

  @valid_attrs %{company: "some content", description: "some content", education_level: "some content", latitude: "90.5", location: %Geo.Point{}, longitude: "120.5", skills: [], title: "some content", recruiter: %RecruitmeApi.Recruiter{}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Job.changeset(%Job{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Job.changeset(%Job{}, @invalid_attrs)
    refute changeset.valid?
  end
end
