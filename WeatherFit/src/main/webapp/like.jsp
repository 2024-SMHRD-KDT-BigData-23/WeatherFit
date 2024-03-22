<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

<button id="btn-like">좋아요버튼</button>

<script>
    $(document).ready(function() {
        $("#btn-like").click(function() {
            // AJAX를 이용하여 서버로 좋아요 요청을 전송
            $.ajax({
                type: "POST", // 요청 방식 (POST로 변경 가능)
                url: "likeController.jsp", // 서버로 요청을 보낼 페이지 URL
                data: { action: "like" }, // 요청에 함께 전송할 데이터 (예: 좋아요인 경우 'action' 파라미터를 'like'로 전송)
                success: function(response) {
                    // 요청이 성공하면 버튼 텍스트를 업데이트
                    $("#btn-like").text("좋아요 " + response.count);
                },
                error: function(xhr, status, error) {
                    // 요청이 실패한 경우 에러 처리
                    console.error(xhr.responseText);
                }
            });
        });
    });
</script>

<script src="assets/js/postlike.js"></script>
</body>
</html>