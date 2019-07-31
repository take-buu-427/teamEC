<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">
  <link rel="stylesheet" href="./css/cssreset.css">
  <link rel="stylesheet" href="./css/panther.css">
  <link rel="stylesheet" href="./css/create.css">
  <link rel="stylesheet" href="./css/header.css">
  <title>パスワード再設定画面</title>

</head>

<body>

	<jsp:include page="header.jsp" />

	<div id="contents">

		<h1>パスワード再設定画面</h1>

		<!-- 各種エラーメッセージ -->

		<s:if test="userIdErrorMessageList != null && userIdErrorMessageList.size()>0">
	      <div class="error">
	        <div class="error-message">
		      <s:iterator value="userIdErrorMessageList">
		        <s:property />
		        <br>
		      </s:iterator>
		    </div>
		  </div>
	    </s:if>

	    <s:if test="passwordErrorMessageList!=null && passwordErrorMessageList.size()>0">
	      <div class="error">
	        <div class="error-message">
		      <s:iterator value="passwordErrorMessageList">
		        <s:property />
		        <br>
		      </s:iterator>
		    </div>
		  </div>
	    </s:if>

	    <s:if test="newPassword1ErrorMessageList!=null && newPassword1ErrorMessageList.size()>0">
	      <div class="error">
	        <div class="error-message">
		      <s:iterator value="newPassword1ErrorMessageList">
		        <s:property />
		        <br>
		      </s:iterator>
		    </div>
		  </div>
	    </s:if>

	    <s:if test="newPassword2ErrorMessageList!=null && newPassword2ErrorMessageList.size()>0">
	      <div class="error">
	        <div class="error-message">
		      <s:iterator value="newPassword2ErrorMessageList">
		        <s:property />
		        <br>
		      </s:iterator>
		    </div>
		  </div>
	    </s:if>

	    <s:if test="idNotPasswordErrorMessage!=null && !idNotPasswordErrorMessage.isEmpty()">
	      <div class="error">
	        <div class="error-message">
		      <s:property value="idNotPasswordErrorMessage"/>
		      <br>
	        </div>
	      </div>
	    </s:if>

	    <s:if test="notNewPasswordErrorMessage!=null && !notNewPasswordErrorMessage.isEmpty()">
	      <div class="error">
		    <div class="error-message">
			  <s:property value="notNewPasswordErrorMessage"/>
			  <br>
		    </div>
	      </div>
	    </s:if>

		<!-- 入力フォーム -->

		<s:form action="ResetPasswordConfirmAction">

			<table class="vertical-list-table">

				<tr>
					<th scope="row"><s:label value="ユーザーID"/></th>
					<td><s:textfield name="userId"
							value="%{#session.userIdForResetPassword}" placeholder="ユーザーID" class="text" /></td>
				</tr>

				<tr>
					<th scope="row"><s:label value="現在のパスワード"/></th>
					<td><s:password name="password" placeholder="現在のパスワード" class="text" /></td>
				</tr>

				<tr>
					<th scope="row"><s:label value="新しいパスワード"/></th>
					<td><s:password name="newPassword1" placeholder="新しいパスワード" class="text" /></td>
				</tr>

				<tr>
					<th scope="row"><s:label value="新しいパスワード（再確認)"/></th>
					<td><s:password name="newPassword2"
							placeholder="新しいパスワード（再確認）" class="text" /></td>
				</tr>

			</table>

			<div class="submit_btn_box3">
		      <s:submit value="確認" class="submit_btn3" />
			</div>

		</s:form>

	</div>

</body>
</html>