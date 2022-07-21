package kr.co.ezenac.model1.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnection {

   public Connection con;
   public Statement stmt;
   public PreparedStatement psmt;
   public ResultSet rs;
   
   public JDBConnection() {
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         
         String url = "jdbc:oracle:thin:@localhost:1521:XE";
         String id = "ezen";
         String pwd = "0824";
         
         con = DriverManager.getConnection(url, id, pwd);
         System.out.println("db 연결 성공");
         
         
      } catch (ClassNotFoundException | SQLException e) {
         e.printStackTrace();
      }
   }
   
   public JDBConnection(String driver, String url, String id, String pwd) {
      try {
         Class.forName(driver);
         con = DriverManager.getConnection(url, id, pwd);
         
      } catch (ClassNotFoundException | SQLException e) {
         e.printStackTrace();
      }
   }
   
   public JDBConnection(ServletContext application) {
	   
	   try {
		String driver = application.getInitParameter("OracleDriver");
		Class.forName(driver);
		
		String url = application.getInitParameter("OracleURL");
		String id = application.getInitParameter("OracleId");
		String pwd = application.getInitParameter("OraclePwd");
		con = DriverManager.getConnection(url, id, pwd);
		
		System.out.println("db 연결 성공 - application");
		
	} 
	   
	   catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
	}
   }
   
   public void close() {
      
         try {
            if(rs != null) rs.close();
            if(stmt != null) stmt.close();
            if(psmt != null) psmt.close();
            if(con != null) con.close();
            
         } catch (SQLException e) {
            e.printStackTrace();
         }
   }
   
}

























