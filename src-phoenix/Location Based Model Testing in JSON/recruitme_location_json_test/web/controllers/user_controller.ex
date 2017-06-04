defmodule RecruitmeLocationJsonTest.UserController do
  use RecruitmeLocationJsonTest.Web, :controller

  require Logger

  alias RecruitmeLocationJsonTest.User

  # Private Function
  # Generate a connection with a not found status so that if we have a resource that is not available we will get a 404 not found
  defp conn_with_status(conn, nil) do
    conn
      |> put_status(:not_found)
  end

  # Private Function
  # Generate a connection with an ok status so that when we have a resource that is ok then it will give an ok status
  defp conn_with_status(conn, _) do
    conn
      |> put_status(:ok)
  end

  # Get the entire index of Users
  def index(conn, _params) do
    users = Repo.all(User)
    json conn_with_status(conn, users), users
  end

  # Get a specific user by ID
  def show(conn, %{"id" => id}) do
    user = Repo.get(User, String.to_integer(id))
    json conn_with_status(conn, user), user
  end

  # Create a user with the specified parameters
  def create(conn, %{"latitude" => latitude, "longitude" => longitude} = params) do
    location_point = %Geo.Point{coordinates: {longitude, latitude}, srid: 4326}
    new_params = %{"name" => params["name"], "email" => params["email"], "location" => location_point, "latitude" => latitude, "longitude" => longitude}
    changeset = User.changeset(%User{}, new_params)
    case Repo.insert(changeset) do
       {:ok, user} -> json conn |> put_status(:created), user
       {:error, _changeset} -> json conn |> put_status(:bad_request), %{errors: ["Unable To Create User"] }
    end
    json conn, nil
  end

  # Update a specific users's parameters
  def update(conn, %{"id" => id, "latitude" => latitude, "longitude" => longitude} = params) do
    location_point = %Geo.Point{coordinates: {longitude, latitude}, srid: 4326}
    user = Repo.get(User, String.to_integer(id))
    if user do
      perform_update(conn, user, params, location_point)
    else
      json conn |> put_status(:not_found), %{errors: ["User Not Found"] }
    end
  end

  # Private Function
  # Perform the update on a specified users's parameters
  defp perform_update(conn, user, params, location_point) do
    new_params = %{"name" => params["name"], "email" => params["email"], "location" => location_point, "latitude" => params["latitude"], "longitude" => params["longitude"]}
    changeset = User.changeset(user, new_params)
    case Repo.update(changeset) do
      {:ok, user} -> json conn |> put_status(:ok), %{acknowledged: ["User Updated"], user: user }
      {:error, _changeset} -> json conn |> put_status(:unprocessable_entity), %{errors: ["Unable To Update User"] }
    end
  end

  # Delete a specific user
  def delete(conn, %{"id" => id}) do
    user = Repo.get!(User, String.to_integer(id))
    if user do
      perform_delete(conn, user)
    else
      json conn |> put_status(:not_found), %{errors: ["User Not Found"] }
    end
  end

  # Private Function
  # Perform the delete on a specified user
  defp perform_delete(conn, user) do
    case Repo.delete(user) do
      {:ok, user} -> json conn |> put_status(:ok), %{acknowledged: ["User Deleted"], user: user }
      {:error, _user} -> json conn |> put_status(:unprocessable_entity), %{errors: ["Unable To Delete User"] }
    end
  end

end
