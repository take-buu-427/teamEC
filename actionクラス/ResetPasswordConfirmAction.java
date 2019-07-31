package com.internousdev.panther.action;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.panther.dao.UserInfoDAO;
import com.internousdev.panther.util.CommonUtility;
import com.internousdev.panther.util.InputChecker;
import com.opensymphony.xwork2.ActionSupport;

public class ResetPasswordConfirmAction extends ActionSupport implements SessionAware{

	private String userId;
	private String password;
	private String newPassword1;
	private String newPassword2;
	private List<String> userIdErrorMessageList;
	private List<String> passwordErrorMessageList;
	private List<String> newPassword1ErrorMessageList;
	private List<String> newPassword2ErrorMessageList;
	private String idNotPasswordErrorMessage;
	private String notNewPasswordErrorMessage;
	private String concealedPassword;
	private Map<String,Object> session;

	public String execute(){

		String result=ERROR;

		session.put("userIdForResetPassword",userId);

		InputChecker ic=new InputChecker();

		userIdErrorMessageList=ic.doCheck("ユーザーID",userId,1,8,true,false,false,true,false,false);
		passwordErrorMessageList=ic.doCheck("現在のパスワード",password,1,16,true,false,false,true,false,false);
		newPassword1ErrorMessageList=ic.doCheck("新しいパスワード",newPassword1,1,16,true,false,false,true,false,false);
		newPassword2ErrorMessageList=ic.doCheck("新しいパスワード（再確認）",newPassword2,1,16,true,false,false,true,false,false);

		if(userIdErrorMessageList.size()>0
				|| passwordErrorMessageList.size()>0
				|| newPassword1ErrorMessageList.size()>0
				|| newPassword2ErrorMessageList.size()>0){
			return result;
		}

		UserInfoDAO userInfoDAO=new UserInfoDAO();
		try{
			if(!userInfoDAO.isExistsUserInfo(userId,password)){
				idNotPasswordErrorMessage="ユーザーIDまたは現在のパスワードが異なります。";
				return result;
			}
		}
		catch(SQLException e){
			e.printStackTrace();
			return "DBError";
		}

		notNewPasswordErrorMessage=ic.doPasswordCheck(newPassword1,newPassword2);
		if(notNewPasswordErrorMessage==null){
			CommonUtility cu=new CommonUtility();
			concealedPassword=cu.concealPassword(newPassword1);
			session.put("newPassword1",newPassword1);
			result=SUCCESS;
		}

		return result;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNewPassword1() {
		return newPassword1;
	}

	public void setNewPassword1(String newPassword1) {
		this.newPassword1 = newPassword1;
	}

	public String getNewPassword2() {
		return newPassword2;
	}

	public void setNewPassword2(String newPassword2) {
		this.newPassword2 = newPassword2;
	}

	public List<String> getUserIdErrorMessageList() {
		return userIdErrorMessageList;
	}

	public void setUserIdErrorMessageList(List<String> userIdErrorMessageList) {
		this.userIdErrorMessageList = userIdErrorMessageList;
	}

	public List<String> getPasswordErrorMessageList() {
		return passwordErrorMessageList;
	}

	public void setPasswordErrorMessageList(List<String> passwordErrorMessageList) {
		this.passwordErrorMessageList = passwordErrorMessageList;
	}

	public List<String> getNewPassword1ErrorMessageList() {
		return newPassword1ErrorMessageList;
	}

	public void setNewPassword1ErrorMessageList(List<String> newPassword1ErrorMessageList) {
		this.newPassword1ErrorMessageList = newPassword1ErrorMessageList;
	}

	public List<String> getNewPassword2ErrorMessageList() {
		return newPassword2ErrorMessageList;
	}

	public void setNewPassword2ErrorMessageList(List<String> newPassword2ErrorMessageList) {
		this.newPassword2ErrorMessageList = newPassword2ErrorMessageList;
	}

	public String getIdNotPasswordErrorMessage() {
		return idNotPasswordErrorMessage;
	}

	public void setIdNotPasswordErrorMessage(String idNotPasswordErrorMessage) {
		this.idNotPasswordErrorMessage = idNotPasswordErrorMessage;
	}

	public String getNotNewPasswordErrorMessage() {
		return notNewPasswordErrorMessage;
	}

	public void setNotNewPasswordErrorMessage(String notNewPasswordErrorMessage) {
		this.notNewPasswordErrorMessage = notNewPasswordErrorMessage;
	}

	public String getConcealedPassword() {
		return concealedPassword;
	}

	public void setConcealedPassword(String concealedPassword) {
		this.concealedPassword = concealedPassword;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
