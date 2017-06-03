defmodule RecruitmeLocationTest.UserTest do
  use RecruitmeLocationTest.ModelCase

  alias RecruitmeLocationTest.User

  @valid_attrs %{email: "some content", location: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
