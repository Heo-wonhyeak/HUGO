package kr.co.ezenac.model1.Membership;

import java.sql.SQLException;

import kr.co.ezenac.model1.common.JDBConnection;

public class MemberDAO extends JDBConnection {

	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	
	public MemberDTO getMember(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM MEMBER WHERE id = ? AND PASS = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);					
			psmt.setString(2, upass);	           
			rs = psmt.executeQuery();				
			
			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return dto;
	}
}














