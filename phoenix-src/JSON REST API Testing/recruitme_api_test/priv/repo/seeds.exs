# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RecruitmeApiTest.Repo.insert!(%RecruitmeApiTest.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

job_params = [
	%{jobID: 1, title: "Senior Java Developer", description: "A description for a senior developer job focused on Java", company: "SPUDS", location: "Tel Aviv, Israel"},
	%{jobID: 2, title: "Junior Java Developer", description: "A description for a junior developer job focused on Java", company: "SPUDS", location: "Tel Aviv, Israel"},
	%{jobID: 3, title: "Senior Ruby Developer", description: "A description for a senior developer job focused on Ruby", company: "SPUDS", location: "Atlanta, GA, USA"},
	%{jobID: 4, title: "Junior Ruby Developer", description: "A description for a junior developer job focused on Ruby", company: "SPUDS", location: "Atlanta, GA, USA"},
	%{jobID: 5, title: "Senior PHP Developer", description: "A description for a senior developer job focused on PHP", company: "SPUDS", location: "New York City, New York, USA"},
	%{jobID: 6, title: "Junior PHP Developer", description: "A description for a junior developer job focused on PHP", company: "SPUDS", location: "New York City, New York, USA"},
	%{jobID: 7, title: "Senior Business Consultant", description: "A description for a senior business consultant job", company: "SPUDS", location: "Reykjavik, Iceland"},
	%{jobID: 8, title: "Junior Business Consultant", description: "A description for a junior business consultant job", company: "SPUDS", location: "Reykjavik, Iceland"},
	%{jobID: 9, title: "Senior Data Scientist", description: "A description for a senior data scientist job", company: "SPUDS", location: "Machu Pichu, Peru"},
	%{jobID: 10, title: "Junior Data Scientist", description: "A description for a junior data scientist job", company: "SPUDS", location: "Machu Pichu, Peru"}
]

Enum.each(job_params, fn(params) ->
	RecruitmeApiTest.Job.changeset(%RecruitmeApiTest.Job{}, params)
	|> RecruitmeApiTest.Repo.insert!()
end)