defmodule RecruitmeFullDataModel.JobsTest do
  use RecruitmeFullDataModel.ModelCase

  alias RecruitmeFullDataModel.Jobs

  @valid_attrs %{company: "some content", description: "some content", education_level: "some content", latitude: "120.5", location: "some content", longitude: "120.5", skills: [], title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Jobs.changeset(%Jobs{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Jobs.changeset(%Jobs{}, @invalid_attrs)
    refute changeset.valid?
  end
end
