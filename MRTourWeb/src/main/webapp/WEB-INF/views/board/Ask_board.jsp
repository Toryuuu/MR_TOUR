<jsp:useBean id="now" class="java.util.Date" />
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<style scoped>
		@import "resources/css/Notice_board.css";
	</style>

	<title>미래투어[1:1 문의]</title>
</head>
<body>
	<!-- header -->
	<%@ include file="../include/header.jsp"%>
<div id = "inc_foot">	
	<div id="contents" class="contents">
		<input type="hidden" id="curPage" value="${curPage }"/>
		<center>
		<div class="text_wrap fix">
			<span class="notice-board">
				<div class="search_field">
					<form action="#" role="search">
						<fieldset>
						<!-- 검색 조건 뷰 -->
							<legend class="blind">나의 1:1 문의 검색</legend> 
							<div class="box_search">
								<div class="select_item">
									<form action="board" class="boardsearch" align="left">
										<select name="searchOption" id="searchOption">
											<option value="MEMBER_NAME" <c:out value="${map.searchOption=='MEMBER_NAME'?'selected':''}"/> >이름</option>
										</select> 
										<input type="text" name="keyword" placeholder="검색어 입력" id="keyword" value="${keyword}"  class="input_keyword">
										<input type="hidden" name="search" id="search" value="s"/>
										<input type="submit" class="btn" value="조회"/>
									</form>	
								</div> 
							 </div>
						 </fieldset>
					 </form>
				 </div>
			</span>
		</div>
		<div class="js_tabs type1">
			<ul class="tabs" style = "width:100%">
				 <li class="disselected" style="width: 24.9%;"><a href="notice">공지사항</a></li>
				 <li class="selected" style="width: 24.9%;"><a href="board">1:1문의</a></li>
				 <li class="disselected" style="width: 24.9%;"><a href="FAQ">FAQ(자주하는 질문)</a></li>
			 </ul>
		 </div> 
		 	 
			<div style="float: right;">
			
			<!-- 검색했을 때 카운트-->
				<c:if test="${map.search eq 's'}">
					<c:choose>
						<c:when test="${map.count == 0 }">
						<br/><span style="font-family:'돋움';">게시글이 없습니다. 검색을 다시 확인해주세요.&nbsp;</span>
						</c:when>
						<c:otherwise>
						<span style="font-family:'돋움';">${map.count}개의 게시물이 있습니다.&nbsp;</span>
						</c:otherwise>
					</c:choose>
				</c:if>
				
			<!-- 회원만 작성 가능 -->
				<c:if test="${member.member_id != null}">
					<button type="button" class="text" onClick="location.href='write'">글쓰기</button>
				</c:if>
			</div>
					
			<br/><br/><br/>
			<div class="tbl">
				<table class="type1">
					  <colgroup>
					  	<col style="width: 10%;">
					    <col>
					    <col style="width: 10%;">
					    <col style="width: 10%;">
					    <col style="width: 10%;">
					  </colgroup> 
					  <thead>
					    <tr>
					      <th>번호</th>
					      <th>제목</th>
					      <th>작성자</th>
					      <th>작성일</th>
					      <th>조회수</th>
					    </tr>
					  </thead> 
					<tbody>		
							<c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
								<c:set var="row" value="${map.list[i]}" />
									<input type="hidden" id="board_no" name="board_no" value="${row.board_no}"/>

								<c:choose>
								<%-- 검색결과가 있을 때 --%>
									<c:when test="${not empty row}">
										<tr>
											<td class="txc">${row.board_no}</td>
											<td class="txl" style="text-align:left;"><a href="view?board_no=${row.board_no}&b_show=Y">${row.b_title}</a>
											<td class="txc" style="text-align:center;">${row.member_name}</td>
											<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="today" />
											<fmt:formatDate value="${row.b_writedate}" pattern="yyyyMMdd" var="regDate"/>
											<c:choose>
												<c:when test="${today == b_writedate}" >
													<td class="txc" style="color:red;">Today</td>					
												</c:when>
												<c:otherwise>
													<td class="txc">${row.b_writedate}</td>
												</c:otherwise>
											</c:choose>
												<td class="txc">${row.b_viewcnt}</td>
										</tr>
									</c:when>
									<%-- 검색결과가 없을 떄 --%>
									<c:when test="${map.count == 0}">
										<tr style="text-align:center;">
											<td colspan='5' size="30px">
												<b style="color: blue; font-size:30px;">'${keyword}'</b> 에 대한 검색결과가 없습니다.
											</td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
				</tbody>
			</table>
			<br />
			<br />
			
			<!-- 페이지 네비게이션 출력 -->
			<div align="center">
				<c:if test="${map.pager.curBlock > 1}">
					<a href="board?curPage=1
							&searchOption=${searchOption}&keyword=${keyword}
							&search=${search}">[처음]</a>
				</c:if>
				<c:if test="${map.pager.curBlock > 1}">
					<a href="board?curPage=${map.pager.prevPage}
							&searchOption=${searchOption}&keyword=${keyword}
							&search=${search}">[이전]</a>
				</c:if>

				<c:forEach var="num" begin="${map.pager.blockBegin}" 
							end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage}">
							<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
							<span style="color: red;">${num}</span>
						</c:when>
						
						<c:otherwise>
							<a href="board?curPage=${num}
							&searchOption=${searchOption}&keyword=${keyword}
							&search=${search}">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
						
				<c:if test="${map.pager.curBlock < map.pager.totBlock}">
					<a href="board?curPage=${map.pager.nextPage}
							&searchOption=${searchOption}&keyword=${keyword}
							&search=${search}">[다음]</a>
				</c:if>
				<c:if test="${(map.pager.totPage > 5) && 
				(map.pager.totPage != map.pager.curPage)}">
					<a href="board?curPage=${map.pager.totPage}
							&searchOption=${searchOption}&keyword=${keyword}
							&search=${search}">[끝]</a>
				</c:if>
			</div>
		</center>
	</div>

	<!-- footer import 필요 -->

</div>
</body>
</html>