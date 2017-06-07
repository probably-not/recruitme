defmodule RecruitmeApi.UserTest do
  use RecruitmeApi.ModelCase

  alias RecruitmeApi.User

  @valid_attrs %{email: "coby.benveniste@gmail.com", name: "some content"}
  @invalid_attrs %{email: "coby.benveniste@gmail", name: "some content"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
