defmodule RecruitmeApiTest.Job do
	use RecruitmeApiTest.Web, :model

	schema "jobs" do
		field :jobID, :integer
		field :title, :string
		field :description, :string
		field :company, :string
		field :location, :string
		timestamps()
	end

	def changeset(model, params \\ :empty) do
    	model
    	  |> cast(params, [:jobID, :title, :description, :company, :location])
    	  |> unique_constraint(:jobID)
  	end

end