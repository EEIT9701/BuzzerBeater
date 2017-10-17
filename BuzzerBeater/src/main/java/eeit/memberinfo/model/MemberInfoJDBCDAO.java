package eeit.memberinfo.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MemberInfoJDBCDAO implements MemberInfoDAO_interface {

	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=BasketBallDB";
	              
	String user = "sa";
	String password = "P@ssw0rd";

	private static final String INSERT_STMT = "INSERT INTO MemberInfo (acc,name,auth,registerTime) VALUES (?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT * FROM MemberInfo order by memberID";
	private static final String GET_ONE_STMT = "SELECT * FROM MemberInfo where memberID = ?";
	private static final String DELETE = "DELETE FROM MemberInfo where memberID = ?";

	private static final String UPDATE = "UPDATE MemberInfo set name=?, auth=?, registerTime=? where memberID = ?";

	public void insert(MemberInfoVO memberInfoVO) {
		 Connection conn = null;
		 PreparedStatement stmt = null;
		
		 try{
		 Class.forName(driver);
		 conn = DriverManager.getConnection(url, user, password);
		 stmt = conn.prepareStatement(INSERT_STMT);
		 
		 stmt.setString(1, memberInfoVO.getAcc());
		 stmt.setString(2, memberInfoVO.getName() );
		 stmt.setString(3, memberInfoVO.getAuth() );
		 stmt.setString(4, memberInfoVO.getRegisterTime() );
		 stmt.executeUpdate();
		
		 }catch(ClassNotFoundException cvfe){
		 cvfe.printStackTrace();
		
		 }catch(SQLException sqle){
		 sqle.printStackTrace();
		 }finally{
			 if(stmt!= null){
				 try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
			 if(conn!=null){
				 try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
			 
		 }
	}

	@Override
	public void update(MemberInfoVO memberInfoVO) {
		 Connection conn = null;
		 PreparedStatement stmt = null;
		
		 try{
		 Class.forName(driver);
		 conn = DriverManager.getConnection(url, user, password);
		 stmt = conn.prepareStatement("UPDATE");
		 
		 stmt.setString(1, memberInfoVO.getAcc());
		 stmt.setString(2, memberInfoVO.getName() );
		 stmt.setString(3, memberInfoVO.getAuth() );
		 stmt.setString(4, memberInfoVO.getRegisterTime() );
		 
		 stmt.executeUpdate();
		 
		 
		 }catch(ClassNotFoundException cvfe){
		 cvfe.printStackTrace();
		
		 }catch(SQLException sqle){
		 sqle.printStackTrace();
		 }

	}

	@Override
	public void delete(Integer memberID) {
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.prepareStatement(DELETE);
			stmt.setInt(1, memberID);
			stmt.executeUpdate();

		} catch (ClassNotFoundException cvfe) {
			cvfe.printStackTrace();

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}finally{
			 if(stmt!= null){
				 try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
			 if(conn!=null){
				 try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
			 
		 }

	}

	@Override
	public MemberInfoVO findByPK(Integer memberID) {

		MemberInfoVO memberInfoVO = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.prepareStatement(GET_ONE_STMT);
			stmt.setInt(1, memberID);
			rs = stmt.executeQuery();

			while (rs.next()) {
				memberInfoVO = new MemberInfoVO();
				memberInfoVO.setMemberID(rs.getInt("memberID"));
				memberInfoVO.setAcc(rs.getString("acc"));
				memberInfoVO.setName(rs.getString("name"));
				memberInfoVO.setAuth(rs.getString("auth"));
				memberInfoVO.setRegisterTime(rs.getString("registerTime"));
				memberInfoVO.setTeamID(rs.getInt("teamID"));
			}

		} catch (ClassNotFoundException cvfe) {
			cvfe.printStackTrace();

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}finally{
			 if(rs != null){
				 try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
			 if(stmt!= null){
				 try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
			 if(conn!=null){
				 try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
			 
		 }

		return memberInfoVO;
	}

	@Override
	public List<MemberInfoVO> getAll() {
		MemberInfoVO memberInfoVO = null;
		List<MemberInfoVO> list = new ArrayList<MemberInfoVO>();
		
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.prepareStatement(GET_ALL_STMT);
			rs = stmt.executeQuery();

			while (rs.next()) {
				memberInfoVO = new MemberInfoVO();
				memberInfoVO.setMemberID(rs.getInt("memberID"));
				memberInfoVO.setAcc(rs.getString("acc"));
				memberInfoVO.setName(rs.getString("name"));
				memberInfoVO.setAuth(rs.getString("auth"));
				memberInfoVO.setRegisterTime(rs.getString("registerTime"));
				memberInfoVO.setTeamID(rs.getInt("teamID"));
				list.add(memberInfoVO);
			}

		} catch (ClassNotFoundException cvfe) {
			cvfe.printStackTrace();

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}finally{
			 if(rs != null){
				 try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
			 if(stmt!= null){
				 try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
			 if(conn!=null){
				 try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
			 
		 }
		
		return list;
	}

//	public static void main(String[] args) {
//		MemberInfoDAO dao = new MemberInfoDAO();
////		
//		//新增
//		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
//		Date date = new Date();
//		String strDate = sdFormat.format(date);
//		
//		
//		MemberInfoVO vo = new MemberInfoVO();
//		vo.setAcc("abc@google.com");
//		vo.setAuth("teams");
//		vo.setName("老虎隊");
//		vo.setRegisterTime(strDate);
//		dao.insert(vo);
//		
		
		//刪除
		//dao.delete(8003);	
		
		//單筆查詢
		//MemberInfoVO memberInfoVO = dao.findByPK(8001);
		//System.out.println(memberInfoVO.getAcc());
		//System.out.println(memberInfoVO.getName());

		/*getAll 查詢*/
//		List<MemberInfoVO> list = dao.getAll();
//		for (MemberInfoVO aMemberInfoVO : list) {
//			System.out.print(aMemberInfoVO.getMemberID() + ",");
//			System.out.print(aMemberInfoVO.getAcc());
//			System.out.print(aMemberInfoVO.getName());
//			System.out.print(aMemberInfoVO.getAuth() + ",");
//			System.out.print(aMemberInfoVO.getRegisterTime() + ",");
//			System.out.print(aMemberInfoVO.getTeamID());
//			System.out.println();
//		}
//	
//	}
}
