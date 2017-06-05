defmodule RecruitmeLocationJsonTest.Job do
  use RecruitmeLocationJsonTest.Web, :model

  @derive {Poison.Encoder, only: [:title, :description, :company, :latitude, :longitude]}
  schema "jobs" do
    field :title, :string
    field :description, :string
    field :company, :string
    field :location, Geo.Point
    field :latitude, :float
    field :longitude, :float

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :company, :location, :latitude, :longitude])
    |> validate_required([:title, :description, :company, :location, :latitude, :longitude])
  end

  # defimpl Poison.Encoder, for: RecruitmeLocationJsonTest.Job do
  #   def encode(model, opts) do
  #     model
  #       |> Map.take([:title, :id, :description, :company])
  #       |> Poison.Encoder.encode(opts)
  #   end
  # end

end
