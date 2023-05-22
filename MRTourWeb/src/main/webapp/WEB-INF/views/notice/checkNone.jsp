<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		@import "resources/css/Notice_board.css";
	</style>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<title>공지사항</title>
</head>
<body>

	<!-- header -->
	<%@ include file="../include/header.jsp"%>
	
<center>
	<div id="contents" class="contents">
		<div class="js_tabs type1">
			 <ul class="tabs" style = "width:100%">
				 <li class="selected" style="width: 24.9%;"><a href="notice">공지사항</a></li>
				 <li class="disselected" style="width: 24.9%;"><a href="board">1:1문의</a></li>
				 <li class="disselected" style="width: 24.9%;"><a href="FAQ">FAQ(자주하는 질문)</a></li>
			 </ul>
		 </div>
		<br/><br/>
		<form>
			<div class="tbl">
				<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->
				<input type="hidden" name="notice_no" value="${notice.notice_no}">
				<table border="1" bordercolor="#E1DCDC"class="type1" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>회원 또는 관리자에 의해 삭제된 공지사항입니다.</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</center>
</body>
</html>