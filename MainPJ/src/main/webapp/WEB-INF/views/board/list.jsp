<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>

</head>
<div class="container">
	<form action="search_results.jsp" method="GET">
		<label for="company">회사</label> <select name="company" id="company">
			<option value="company1">이피피에스</option>
			<option value="company2">삼성</option>
			<option value="company3">LG</option>
			<option value="company4">SK</option>
			<option value="company5">KT</option>
		</select>
		<label for="registrant">등록자</label>
		<input type="text" id="registrant" name="registrant">
		<label for="start_date">등록일자</label>
		<input type="date" id="start_date" name="start_date">
		<label for="end_date"> ~ </label> 
		<input type="date" id="end_date" name="end_date"> 
		<input type="submit" value="검색">
	</form>
</div>

<div class="container">
	<div class="text-right">
		<c:forEach items="${list}" var="dto">
			<a href="/board/insert" class="btn">등록</a>
			<a href="/board/updateui/${dto.bno}/${pt.curpage}/${pt.criteria}${empty pt.keyword?'':'/'}${pt.keyword}" class="btn">수정</a>
			<a href="/board/delete" class="btn">삭제</a> 
			<a href="/board/read/${dto.bno}/${pt.curpage}/${pt.criteria}${empty pt.keyword?'':'/'}${pt.keyword}" class="btn">조회</a>
		</c:forEach>
	</div>
</div>

<body>
	<div class="container">
		<table class="table table-light">
			<thead>
				<tr class="table-head">
					<th scope="col" class="text-center">선택</th>
					<th scope="col" class="text-center">제목</th>
					<th scope="col" class="text-center">등록일자</th>
					<th scope="col" class="text-center">등록자</th>
					<th scope="col" class="text-center">조회수</th>
					<th scope="col" class="text-center">첨부파일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td class="text-center"><input type="checkbox" name="check" value="${dto.bno}"></td>
						<td class="text-center">${dto.title}</td>
						<td class="text-center">${dto.regdate}</td>
						<td class="text-center">${dto.id}</td>
						<td class="text-center">${dto.readcnt}</td>
						<td class="text-center">X</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


	</div>


	<script type="text/javascript">
		$(document).ready(function() {
			$("form").on("click", "#search_submit", function(event) {
				event.preventDefault();
				let criteria = $("select[name='criteria']").val();
				let keyword = $("input[name='keyword']").val();

				let uri = "/board/list/" + criteria + "/" + keyword;

				$("form").attr("action", uri);
				$("form").attr("method", "post");
				if (keyword == "") {
					alert("검색어를 입력하세요")
					return false;
				}
				$("form").submit();
			});
		});
	</script>



</body>
</html>