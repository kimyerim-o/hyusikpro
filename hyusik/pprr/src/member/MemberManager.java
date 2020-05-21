package member;

public class MemberManager {
	
	public MemberDto getData(String id){
		MemberDto dto = null;
		try {
			String sql = "select id, password, name, birth, gender from webshop_member where id like ?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new MemberDto();
				dto.setemail(rs.getString("email"));
				dto.setPass(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setMail(rs.getString("birth"));
				dto.setPhone(rs.getString("gender"));

			}			
		} catch (Exception e) {
			System.out.println("getData err : " + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {

				// TODO: handle exception

			}

		}

		return dto;

	}



출처: https://sourcestudy.tistory.com/344 [study]
}
