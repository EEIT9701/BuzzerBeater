package eeit.gamemedia.model;

import java.io.Serializable;
import java.sql.Timestamp;

import eeit.games.model.GamesVO;

public class GameMediaVO implements Serializable {

	private static final long serialVersionUID = 4235190591600435986L;

	private Integer mediaID;// ID

	private GamesVO gamesVO;// replace gameID

	private String mediasName;
	private String gameVideo;
	private String gamePhoto;
	private String mediaType;
	private Timestamp mediaDate;
	private String descriptions;
	private String tag;

	public GamesVO getGamesVO() {
		return gamesVO;
	}

	public void setGamesVO(GamesVO gamesVO) {
		this.gamesVO = gamesVO;
	}

	public Integer getMediaID() {
		return mediaID;
	}

	public void setMediaID(Integer mediaID) {
		this.mediaID = mediaID;
	}

	public String getMediasName() {
		return mediasName;
	}

	public void setMediasName(String mediasName) {
		this.mediasName = mediasName;
	}

	public String getGameVideo() {
		return gameVideo;
	}

	public void setGameVideo(String gameVideo) {
		this.gameVideo = gameVideo;
	}

	public String getGamePhoto() {
		return gamePhoto;
	}

	public void setGamePhoto(String gamePhoto) {
		this.gamePhoto = gamePhoto;
	}

	public String getMediaType() {
		return mediaType;
	}

	public void setMediaType(String mediaType) {
		this.mediaType = mediaType;
	}

	public Timestamp getMediaDate() {
		return mediaDate;
	}

	public void setMediaDate(Timestamp mediaDate) {
		this.mediaDate = mediaDate;
	}

	public String getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

}
