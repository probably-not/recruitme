defmodule RecruitmeLocationJsonTest.JobTest do
  use RecruitmeLocationJsonTest.ModelCase

  alias RecruitmeLocationJsonTest.Job

  @valid_attrs %{company: "some content", description: "some content", location: "some content", title: "some content"}
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
