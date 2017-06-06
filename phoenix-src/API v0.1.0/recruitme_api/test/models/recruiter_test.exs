defmodule RecruitmeApi.RecruiterTest do
  use RecruitmeApi.ModelCase

  alias RecruitmeApi.Recruiter

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Recruiter.changeset(%Recruiter{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Recruiter.changeset(%Recruiter{}, @invalid_attrs)
    refute changeset.valid?
  end
end
