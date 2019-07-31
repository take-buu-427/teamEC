package com.internousdev.panther.action;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.panther.dao.UserInfoDAO;
import com.opensymphony.xwork2.ActionSupport;

public class ResetPasswordCompleteAction extends ActionSupport implements SessionAware{

	private Map<String,Object> session;

	public String execute(){

		String result=ERROR;

		UserInfoDAO userInfoDAO=new UserInfoDAO();
		try{
			int count=userInfoDAO.resetPassword(session.get("userIdForResetPassword").toString(),session.get("newPassword1").toString());
			if(count>0){
				result=SUCCESS;
			}
		}
		catch(SQLException e){
			e.printStackTrace();
			return ERROR;
		}

		session.remove("userIdForResetPassword");
		session.remove("newPassword1");

		return result;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
