defmodule RecruitmeApi.JobTest do
  use RecruitmeApi.ModelCase

  alias RecruitmeApi.Job

  @valid_attrs %{title: "job title", description: "job description", company: "a company", skills: [], education_level: "an education level", latitude: 10.0, longitude: 10.0, location: %Geo.Point{}, recruiter: %RecruitmeApi.Recruiter{}}
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