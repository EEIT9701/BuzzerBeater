package eeit.personaldata.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;

public class jdbc {

	public static void main(Integer game) {
		String diver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url="jdbc:sqlserver://localhost:1433;DatabaseName=BasketBallDB";
		String user="sa";
		String password="P@ssw0rd";
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		String INSERT_STMT=null;
		INSERT_STMT = "INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70104,?,3007,2196,11,18,1,3,4,5,0,10,4,2,2,0,2,27,1);"
				+"INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70106,?,3007,2046,9,18,3,10,5,6,0,3,4,0,0,4,1,26,1);"
				+"INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70108,?,3007,2001,5,13,1,6,0,0,0,1,2,0,0,1,4,11,1);"
				+"INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70109,?,3007,1957,7,14,2,5,2,2,5,7,6,5,1,2,2,18,1);"
				+"INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70117,?,3007,1205,1,1,0,0,0,0,1,2,1,0,0,3,2,2,1);"
				+"INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70118,?,3008,2111,10,20,1,1,5,6,8,6,3,1,0,2,1,26,1);"
				+"INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70121,?,3008,1923,10,21,0,3,15,15,3,2,3,5,0,2,1,35,1);"
				+"INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70122,?,3008,1588,4,9,1,2,0,0,0,3,4,0,0,2,4,9,1);"
				+"INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70125,?,3008,1344,1,1,1,1,0,0,2,2,0,1,0,0,1,3,1);"
				+"INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(70126,?,3008,1096,1,4,0,0,0,0,0,4,1,0,0,1,3,2,1);"
				+"UPDATE games set teamAScore=84,teamBScore=75,winnerID=3001 where gameID =?;"
				;
			try {
				Class.forName(diver);
			con=DriverManager.getConnection(url, user, password);
		    pstmt=con.prepareStatement(INSERT_STMT);
		    for(int i=1;i<12;i++) {
		    pstmt.setInt(i,game);
		    
		    }
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
