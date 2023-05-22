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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		@import "resources/css/Notice_board.css";
	</style>
	<script>
		// 게시물 삭제 확인
		function deleteN() {
			swal({
				 icon: "warning",
				 text: "정말 게시글을 삭제하시겠습니까?",
				 closeOnClickOutside : false,
				 closeOnEsc : false, 
				 buttons: ["돌아가기", "삭제하기"],
				}).then(function(isConfirm) {
				  if (isConfirm) {
				    swal('삭제 완료!','게시글을 삭제했습니다.','success').then(function(isConfirm)
				   		{
							location.href='deleteNotice?notice_no='+${notice.notice_no};
				    	});
				  }
				})
		}
		
		$("#list_btn").click(function(){
			self.location="notice?"
					+ "searchOption=${searchOption}&keyword=${keyword}"
					+ "&search=${search}&curPage=${curPage}";
		});
	</script>
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
				<td width="70">구분</td>
				<td width="120" align="left">${notice.notice_sub}</td>
				
				<td>작성자</td>
				<td align="left">${notice.member_name}</td>
				
				<td>작성일</td>
				<td align="left">${notice.notice_date}	</td>
			</tr>

				
			<tr>
				<td>제목</td>
				<td colspan = "5" align="left">
					<div style="width:790px; float:left; text-align : left;"">
					 ${notice.notice_title}
					</div>
					<div>
					|&nbsp;&nbsp;&nbsp;조회수 : ${notice.n_viewCnt}
					</div>
				</td>
			</tr>
			
			<tr valign="top">
				<td colspan='6' height="500px">${notice.notice_content}</td>
			</tr>
		</table>
	</div>
	</form>
	<div style="margin-top: 10px; margin-bottom:20px;">
		<div align="center" style="float:left; ">
			<c:if test="${map.previousN != null}">
			<button class="previous" onClick="location.href='n_view?notice_no=${map.previousN.notice_no}&n_show=Y'">이전글</button>
			</c:if>
			<c:if test="${map.nextN != null}">
			<button class="next" onClick="location.href='n_view?notice_no=${map.nextN.notice_no}&n_show=Y'">다음글</button>
			</c:if>
			&nbsp;&nbsp;&nbsp;게시글 번호 : ${notice.notice_no}
		</div>

		<div style="float:right;">
		
		<!-- 관리자만 생성/수정/삭제 가능 -->
		<c:if test="${member.member_id eq 'admin'}">
			<a href="updateNotice">수정</a>&nbsp;&nbsp;&nbsp;
			<a href="#" onClick="deleteN()">삭제</a>&nbsp;&nbsp;&nbsp;
		</c:if>
		
		<button type="button" id="list_btn" onClick="location.href='notice'">목록</button>
		</div>
		</div>
		</div>
	
	
	<br/><br/><br/>
	<!-- 현재 글을 기준으로 이전글,다음글 리스트 -->
	<div align="center" class = "nextprev">
		<table class="simpleView" width="800">
			<c:choose>
				<c:when test="${map.previousN != null}">
					<tr class="a">
						<td onClick="location.href='n_view?notice_no=${map.previousN.notice_no}&n_show=Y'" style="cursor: pointer">이전글</td>
						<td onClick="location.href='n_view?notice_no=${map.previousN.notice_no}&n_show=Y'" style="cursor: pointer;width:400px;">${map.previousN.notice_title}</td>
						<td class="tdS">${map.previousN.member_name}</td><td class="tdS">${map.previousN.notice_date}</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr class="a">
						<td rowspan = "4"></td>
					</tr>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${map.nextN != null}">
					<tr class="b">
						<td onClick="location.href='n_view?notice_no=${map.nextN.notice_no}&n_show=Y'" style="cursor: pointer">다음글</td>
						<td  onClick="location.href='n_view?notice_no=${map.nextN.notice_no}&n_show=Y'" style="cursor: pointer;width:400px;">${map.nextN.notice_title}</td>
						<td class="tdS">${map.nextN.member_name}</td><td class="tdS">${map.nextN.notice_date}</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr class="b">
						<td rowspan = "4"></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</center>
</body>
</html>