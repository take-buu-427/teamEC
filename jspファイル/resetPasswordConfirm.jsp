<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">
  <link rel="stylesheet" href="./css/panther.css">
  <link rel="stylesheet" href="./css/confirm.css">
  <link rel="stylesheet" href="./css/cssreset.css">
  <link rel="stylesheet" href="./css/header.css">
  <title>パスワード再設定確認画面</title>

</head>

<body>

	<script src="./js/resetPassword.js"></script>

	<jsp:include page="header.jsp" />

	<div id="contents">

		<h1>パスワード再設定確認画面</h1>

		<s:form id="resetPasswordForm">

			<table class="vertical-list-table">

				<tr>
					<th scope="row"><s:label value="ユーザーID"/></th>
					<td><s:property value="userId" /></td>
				</tr>
				<tr>
					<th scope="row"><s:label value="新しいパスワード"/></th>
					<td><s:property value="concealedPassword" /></td>
				</tr>

			</table>

			<div class="submit_btn_box3">
				<s:submit value="パスワード再設定" class="submit_btn3" onclick="goResetPasswordCompleteAction()" />
			</div>
			<div class="submit_btn_box3">
				<s:submit value="戻る" class="submit_btn3" onclick="goResetPasswordAction()" />
			</div>
			<s:hidden id="backFlag" name="backFlag" value="" />

		</s:form>
	</div>

</body>
</html>