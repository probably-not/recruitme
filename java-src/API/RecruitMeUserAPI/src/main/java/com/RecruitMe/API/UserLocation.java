package com.RecruitMe.API;

/**
 * The UserLocation class represents the location of the user
 * @author cobybenveniste
 */
public class UserLocation {
	private long latitude;
	private long longitude;
	private String name;
	
	public UserLocation(long latitude, long longitude, String name) {
		this.setLatitude(latitude);
		this.setLongitude(longitude);
		this.setName(name);
	}
	
	public UserLocation(String locationName) {
		//TODO: Create a method to get the UserLocation by Location Name
	}

	public UserLocation(long zipCode) {
		//TODO: Create a method to get the UserLocation by zip code
	}

	/**
	 * @return the latitude of the User
	 */
	public long getLatitude() {
		return latitude;
	}

	/**
	 * @param latitude the latitude to set for the User
	 */
	public void setLatitude(long latitude) {
		this.latitude = latitude;
	}

	/**
	 * @return the longitude of the User
	 */
	public long getLongitude() {
		return longitude;
	}

	/**
	 * @param longitude the longitude to set for the User
	 */
	public void setLongitude(long longitude) {
		this.longitude = longitude;
	}

	/**
	 * @return the name of the location of the User (can be city name, street name, neighborhood name, etc.)
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set for the location of the User (can be city name, street name, neighborhood name, etc.)
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * The getUserLocation method is used to generate the user location based on the current location of the user
	 * @return the current user location of the user
	 */
	public static UserLocation getUserLocation() {
		//TODO: Create a method to get the UserLocation of a User without them entering it
		return null;
	}
}
