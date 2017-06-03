# RecruitMe

RecruitMe is an application that will allow job seekers and recruiters to connect in a more user friendly fashion. Think Tinder, but for jobs.

**JobSeekers** *(people looking for jobs)* will be able to set up their profiles with what skills they have, what their education level is, and any previous experience they may have, along with a distance radius to show how far away they are willing to look for a job. Their location will be automatically set from their location services on their phone/tablet/computer (constantly updating as the app is turned on). Once their profiles are set up, RecruitMe will show the jobs that are within the radius that they have chosen, along with a "Match Percentage" to show how well the job matches their profile. The higher the percentage, the more the job matches the JobSeeker's preferences.

**Recruiters** *(people looking for candidates for jobs)* will be able to set up various jobs on their account, and see what JobSeekers have matched with the jobs that they have set up.

**Jobs** will belong to Recruiters. Each job will have a set of skills, a preferred education level, preferred previous experience, and the location of the office that the job is referring to.

## Development

RecruitMe will be built in two separate phases: [Phase 1 (Backend API Development)](#phase-1-backend-api-development) and [Phase 2 (Frontend Application Development)](#phase-2-frontend-application-development)

### Phase 1: Backend API Development

Phase 1 will be developing the Backend API, which will be built using the [Phoenix Framework](http://phoenixframework.org/). The API is being built with speed and scalability in mind, hence using the [Phoenix Framework](http://www.phoenixframework.org/blog/the-road-to-2-million-websocket-connections).

#### API TODOs

- [ ] Data Model needs to be set up (#2)
- [ ] API needs to be created with full JSON REST (#3)
- [ ] Users will be able to login and logout (#4)
- [ ] Users will have various roles available to them (JobSeeker, Recruiter, *Premium JobSeeker*, *Premium Recruiter*) (#5)
- [ ] If a JobSeeker signs in, the API will return Jobs within the specified radius of the JobSeeker (#6)
- [ ] If a Recruiter signs in, they will be able to select which Job they are looking at, and then see the relevant JobSeekers (#6)
- [ ] JobSeekers should be able to like or dislike Jobs (#7)
- [ ] Liked Jobs should go to the JobSeeker's saved Jobs (#7)
- [ ] Disliked Jobs should be hidden from the JobSeeker (#7)
- [ ] Recruiters should be able to like or dislike JobSeekers for each Job that they have listed (#7)
- [ ] Liked JobSeekers should go to the Recruiter's saved JobSeekers (#7)
- [ ] Disliked JobSeekers should be hidden from the Recruiter for this specific Job (#7)
- [ ] Each JobSeeker will have a Match Percentage calculated for each Job they see (#8)
- [ ] Each Job will have a Match Percentage calculated for each JobSeeker they see (#8)

### Phase 2: Frontend Application Development

Phase 2 will be developing the native applications for each platform that RecruitMe will be used on. The aim is to create an Android application, an iOS application, and a Web Application, so that all phone users can use the platform. Since [Phase 1](#phase-1-backend-api-development) will be developing the full backend, the native applications will only need to query the API, so there should be no heavy lifting on the application side.

#### Frontend TODOs
- [ ] Create Web Application
- [ ] Create iOS Application
- [ ] Create Android Application