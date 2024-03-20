<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	<h1>신규 게시글 작성</h1>
	<form action="#">
		<table>
			<tr>
				<td>작성자</td>
				<td>&nbsp${member.userId}</td>
			</tr>
			<tr>
				<td>쉬발아</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="20"></textarea> </td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">저장</button>
					<button type="button">목록으로</button>
					<button type="reset">초기화</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>