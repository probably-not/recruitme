package com.RecruitMe.API;
import org.springframework.data.annotation.Id;

/**
 * The Recruiter class is used to define Recruiters on RecruitMe.
 * Recruiters are people who post jobs for companies and look for JobSeekers to hire
 * @author cobybenveniste
 */
public class Recruiter {
	@Id private String id;
	private String firstName;
	private String lastName;
	private String company;
	private UserLocation location;
	
	public Recruiter(String firstName, String lastName, String company) {
		this.setFirstName(firstName);
		this.setLastName(lastName);
		this.setCompany(company);
		this.setLocation(UserLocation.getUserLocation());
	}

	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * @return the company
	 */
	public String getCompany() {
		return company;
	}

	/**
	 * @param company the company to set
	 */
	public void setCompany(String company) {
		this.company = company;
	}

	/**
	 * @return the location of the Recruiter
	 */
	public UserLocation getLocation() {
		return location;
	}

	/**
	 * @param location the location to set for the Recruiter
	 */
	private void setLocation(UserLocation location) {
		this.location = location;
	}
}
