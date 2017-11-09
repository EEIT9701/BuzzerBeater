package eeit.personaldata.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;

public class jdbc {

	public static void main(String[] args) {
		String diver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url="jdbc:sqlserver://localhost:1433;DatabaseName=BasketBallDB";
		String user="sa";
		String password="P@ssw0rd";
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		String INSERT_STMT=null;
		INSERT_STMT = "INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70004,4007,3001,2196,11,18,1,3,4,5,0,10,4,2,2,0,2,27,1);"
				+"INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70003,4007,3001,2046,9,18,3,10,5,6,0,3,4,0,0,4,1,26,1);"
				+"INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70014,4007,3001,2001,5,13,1,6,0,0,0,1,2,0,0,1,4,11,1);"
				+"INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70005,4007,3001,1957,7,14,2,5,2,2,5,7,6,5,1,2,2,18,1);"
				+"INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70013,4007,3001,1205,1,1,0,0,0,0,1,2,1,0,0,3,2,2,1);"
				+"INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70018,4007,3002,2111,10,20,1,1,5,6,8,6,3,1,0,2,1,26,1);"
				+"INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70029,4007,3002,1923,10,21,0,3,15,15,3,2,3,5,0,2,1,35,1);"
				+"INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70032,4007,3002,1588,4,9,1,2,0,0,0,3,4,0,0,2,4,9,1);"
				+"INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70019,4007,3002,1344,1,1,1,1,0,0,2,2,0,1,0,0,1,3,1);"
				+"INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70024,4007,3002,1096,1,4,0,0,0,0,0,4,1,0,0,1,3,2,1);"
				+"UPDATE games set teamAScore=84,teamBScore=75,winnerID=3001 where gameID =4007;"
				;
			try {
				Class.forName(diver);
			con=DriverManager.getConnection(url, user, password);
		    pstmt=con.prepareStatement(INSERT_STMT);
			pstmt.executeUpdate();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
