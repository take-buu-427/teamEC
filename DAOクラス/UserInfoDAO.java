package com.internousdev.panther.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.internousdev.panther.dto.UserInfoDTO;
import com.internousdev.panther.util.DBConnector;

public class UserInfoDAO {

	public boolean canLogin(String userId,String password) throws SQLException{//Login可能か判断

		boolean result = false;
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		String sql ="select * from user_info where user_id=? and password=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, userId);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();

		if(rs.next()){
			result = true;
		}
		if(result){//テーブルのログインフラグ更新
			String sql1 = "update user_info set logined = 1,update_date = now() where user_id = ?";
			PreparedStatement ps1 = con.prepareStatement(sql1);
			ps1.setString(1, userId);
			ps1.execute();
		}

		    con.close();

		return result;
	}

	public UserInfoDTO getUserInfo(String userId) throws SQLException{

		 DBConnector db = new DBConnector();
		 Connection con = db.getConnection();
		 UserInfoDTO userInfoDTO = new UserInfoDTO();
		 String sql = "select * from user_info where user_id=?";

		 PreparedStatement ps = con.prepareStatement(sql);
		 ps.setString(1,userId);
		 ResultSet rs = ps.executeQuery();

		 	while(rs.next()){
		 		userInfoDTO.setUserInfoId(rs.getInt("id"));
		 		userInfoDTO.setUserId(rs.getString("user_id"));
		 		userInfoDTO.setPassword(rs.getString("password"));
		 		userInfoDTO.setFamilyName(rs.getString("family_name"));
		 		userInfoDTO.setFirstName(rs.getString("first_name"));
		 		userInfoDTO.setFamilyNameKana(rs.getString("family_name_kana"));
		 		userInfoDTO.setFirstNameKana(rs.getString("first_name_kana"));
		 		userInfoDTO.setSex(rs.getInt("sex"));
		 		userInfoDTO.setEmail(rs.getString("email"));
		 		userInfoDTO.setLogined(rs.getInt("logined"));
		 	}

			 con.close();

		 return userInfoDTO;
	}

	public int logout(String userId) throws SQLException{  //ログアウト処理

		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		int result = 0;
		String sql = "update user_info set logined=0, update_date=now() where user_id=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			result = ps.executeUpdate();

			con.close();

		return result;
	}

	//ユーザーの存在チェック(ユーザー登録時)
	public boolean isExistsUserInfo(String userId)throws SQLException{

		DBConnector db=new DBConnector();
		Connection con=db.getConnection();
		boolean result=false;
		String sql="select count(*) as count from user_info where user_id=?";

			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,userId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				if(rs.getInt("count")>0){
					result=true;
					}
			}

			con.close();

			return result;
		}

	//ユーザー登録
	public int createUser(String familyName, String firstName, String familyNameKana,
			String firstNameKana, String sex, String email, String userId, String password) throws SQLException{

		DBConnector db=new DBConnector();
		Connection con=db.getConnection();
		int count=0;
		String sql="insert into user_info(user_id, password, family_name, first_name, family_name_kana,"
				+ "first_name_kana, sex, email, status, logined, regist_date, update_date)"
				+ "values(?,?,?,?,?,?,?,?,?,?, now(), now())";

			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,userId);
			ps.setString(2,password);
			ps.setString(3,familyName);
			ps.setString(4,firstName);
			ps.setString(5,familyNameKana);
			ps.setString(6,firstNameKana);
			ps.setString(7,sex);
			ps.setString(8,email);
			ps.setInt(9,0);
			ps.setInt(10,1);
			count=ps.executeUpdate();

		con.close();

		return count;
	}

	//ユーザーの存在チェック(パスワード再設定時)
	public boolean isExistsUserInfo(String userId,String password) throws SQLException{

		DBConnector db=new DBConnector();
		Connection con=db.getConnection();
		boolean result=false;
		String sql="select count(*) as count from user_info where user_id=? and password=?";

		 PreparedStatement ps=con.prepareStatement(sql);
		 ps.setString(1,userId);
		 ps.setString(2,password);
		 ResultSet rs=ps.executeQuery();
		 while(rs.next()){
			 if(rs.getInt("count")>0){
				 result=true;
			 }
		 }

		con.close();

		return result;
	}

	//パスワード再設定
	public int resetPassword(String userId,String newPassword1) throws SQLException{

		DBConnector db=new DBConnector();
		Connection con=db.getConnection();
		int result=0;
		String sql="update user_info set password=?, update_date=now() where user_id=?";

		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1,newPassword1);
		ps.setString(2,userId);
		result=ps.executeUpdate();

		con.close();

		return result;
	}
}
