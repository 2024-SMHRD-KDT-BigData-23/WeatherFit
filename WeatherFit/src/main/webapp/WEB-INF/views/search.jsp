<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<header class="p-3 bg-light">
        <div class="container d-flex align-items-center justify-content-between">
            <div class="logo">
                WeatherWidget
            </div>
            <div class="title">
                WeatherFit
            </div>
            <ul class="nav nav-underline">
                <li class="nav-item"><a class="nav-link" id = "redirecthome">홈</a></li>
                <li class="nav-item"><a class="nav-link" href="Search.do">검색</a></li>
                <li class="nav-item"><a class="nav-link" href="#">팔로우</a></li>
                <li class="nav-item"><a class="nav-link" href="Message.do">메시지</a></li>
                <li class="nav-item"><a class="nav-link" href="#">알림</a></li>
                <button type="button" class="btn btn-primary" id="btn-logout">로그아웃</button>
        </ul>
        </div>
    </header>
    <main>
        <form class="d-flex justify-content-center align-items-center" role="search" action="#" method="post">
            <input type="search" name="search" id="search" placeholder="검색어를 입력하세요.">
            <input type="submit" value="검색">
            <div class="d-flex flex-column">
                <ul id="search-list"></ul>
            </div>
        </form>
        <div id=ajaxcontainer></div>
    </main>

    <script src="assets/js/search1.js"></script>
</body>
</html>