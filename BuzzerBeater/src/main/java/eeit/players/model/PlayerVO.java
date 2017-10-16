package eeit.players.model;

import java.sql.Date;

public class PlayerVO implements java.io.Serializable {
	private Integer playerID;
	private String playerName;
	private String id;
	private Integer height;//Double height
	private Integer weights;//Double weights
	private Date birthday;
	private String nationality;
	public Integer getPlayerID() {
		return playerID;
	}
	public void setPlayerID(Integer playerID) {
		this.playerID = playerID;
	}
	public String getPlayerName() {
		return playerName;
	}
	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getHeight() {
		return height;
	}
	public void setHeight(Integer height) {
		this.height = height;
	}
	public Integer getWeights() {
		return weights;
	}
	public void setWeights(Integer weights) {
		this.weights = weights;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	
	
}
