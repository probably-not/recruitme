defmodule RecruitmeFullDataModel.JobSeekerTest do
  use RecruitmeFullDataModel.ModelCase

  alias RecruitmeFullDataModel.JobSeeker

  @valid_attrs %{education_level: "some content", location: "some content", skills: []}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = JobSeeker.changeset(%JobSeeker{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = JobSeeker.changeset(%JobSeeker{}, @invalid_attrs)
    refute changeset.valid?
  end
end
