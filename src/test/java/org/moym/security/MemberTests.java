

package org.moym.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberTests {
	
	@Setter(onMethod_ = {@Autowired})
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = {@Autowired})
	private DataSource ds;
	
	@Test
	public void nothing_() {
		log.info(ds);
	}
	
	/*use this for test
	@Test
	public void testInsertMember() {
		
		String sql = "insert into tbl_member(userid, userpw, username, email, job) values (?,?,?,?,?)";
		
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, "userhh");
				pstmt.setString(2, pwencoder.encode("asdf1234"));
				pstmt.setString(3, "hwany");
				pstmt.setString(4, "khh8269@gmail.com");
				pstmt.setString(5, "artist");
				
				pstmt.executeUpdate();
				
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				if(pstmt !=null) {try {pstmt.close();} catch (Exception e) {}}
				if(con !=null) {try {con.close();} catch (Exception e) {}}
			}	
	}
	*/
	
	
	/*use this for test
	@Test
	public void testInsertAuth() {
		
		String sql = "insert into tbl_member_auth (userid, auth, job) values (?,?,?)";
		
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, "userhh");
				pstmt.setString(2, "ROLE_USER");
				pstmt.setString(3, "artist");
				
				pstmt.executeUpdate();
				
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				if(pstmt !=null) {try {pstmt.close();} catch (Exception e) {}}
				if(con !=null) {try {con.close();} catch (Exception e) {}}
			}
	}
	*/

	/*
	@Test
	public void testInsertMember() {
		
		String sql = "insert into tbl_member(userid, userpw, username, email) values (?,?,?,?)";
		
		for(int i = 0; i < 10; i++) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(2, pwencoder.encode("pw" + i));
				pstmt.setString(4, pwencoder.encode("khh1888@naver.com"));
				
				if(i < 8) {
					pstmt.setString(1, "user" + i);
					pstmt.setString(3, "�Ϲݻ����" + i);
				
				}else if(i <9) {
					pstmt.setString(1, "manager" + i);
					pstmt.setString(3, "���" + i);
					
				}else {
					pstmt.setString(1, "admin" + i);
					pstmt.setString(3, "������" + i);
				}
				
				pstmt.executeUpdate();
				
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				if(pstmt !=null) {try {pstmt.close();} catch (Exception e) {}}
				if(con !=null) {try {con.close();} catch (Exception e) {}}
			}
		}
		
	}
	*/
	
	/*
	@Test
	public void testInsertAuth() {
		
		String sql = "insert into tbl_member_auth (userid, auth) values (?,?)";
		
		for(int i = 0; i < 10; i++) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				if(i < 8) {
					pstmt.setString(1, "user" + i);
					pstmt.setString(2, "ROLE_USER");
				
				}else if(i <9) {
					pstmt.setString(1, "manager" + i);
					pstmt.setString(2, "ROLE_MEMBER");
					
				}else {
					pstmt.setString(1, "admin" + i);
					pstmt.setString(2, "ROLE_ADMIN");
				}
				
				pstmt.executeUpdate();
				
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				if(pstmt !=null) {try {pstmt.close();} catch (Exception e) {}}
				if(con !=null) {try {con.close();} catch (Exception e) {}}
			}
		}
		
	}
	
	*/
	
}
