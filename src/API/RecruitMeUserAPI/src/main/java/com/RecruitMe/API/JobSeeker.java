package com.RecruitMe.API;
import java.util.ArrayList;
import org.springframework.data.annotation.Id;

/**
 * The JobSeeker class is used to define JobSeekers on RecruitMe.
 * JobSeekers are people who are currently looking for jobs.
 * @author cobybenveniste
 */

public class JobSeeker {
	@Id private String id;
	private String firstName;
	private String lastName;
	private UserLocation location;
	public ArrayList<String> skillTags;
	
	public JobSeeker(String firstName, String lastName) {
		this.setFirstName(firstName);
		this.setLastName(lastName);
		this.setLocation(UserLocation.getUserLocation());
		this.setSkillTags(new ArrayList<String>());
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
	 * @return the location of the JobSeeker
	 */
	public UserLocation getLocation() {
		return location;
	}

	
	/**
	 * @param location the location to set for the JobSeeker
	 */
	private void setLocation(UserLocation location) {
		this.location = location;
	}

	
	/**
	 * @return the skillTags
	 */
	public ArrayList<String> getSkillTags() {
		return skillTags;
	}

	/**
	 * @param skillTags the skillTags to set
	 */
	private void setSkillTags(ArrayList<String> skillTags) {
		this.skillTags = skillTags;
	}
}