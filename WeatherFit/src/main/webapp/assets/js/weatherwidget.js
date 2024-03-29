let RE = 6371.00877; // 지구 반경(km)
let GRID = 5.0; // 격자 간격(km)
let SLAT1 = 30.0; // 투영 위도1(degree)
let SLAT2 = 60.0; // 투영 위도2(degree)
let OLON = 126.0; // 기준점 경도(degree)
let OLAT = 38.0; // 기준점 위도(degree)
let XO = 43; // 기준점 X좌표(GRID)
let YO = 136; // 기1준점 Y좌표(GRID)

const sunny = 1; // 맑음
const many_cloudy = 3; // 구름많음
const cloudy = 4; // 흐림

const none = 0; // 없음
const rain = 1; // 비
const snow_rain = 2; // 비/눈
const snow = 3; // 눈
const shower = 4; // 소나기
const raindrop = 5; // 빗방울
const raindrop_blowingsnow = 6; // 빗방울/눈날림
const blowingsnow = 7; // 눈날림

/*
*  날짜 변수
*/
let now = new Date();

let year = now.getFullYear();
let month = ('0' + (now.getMonth() + 1)).slice(-2);
let day = ('0' + now.getDate()).slice(-2);
let base_date = year + month + day;
/*
* 시간 변수
*/
let hours = ('0' + now.getHours()).slice(-2);
let minutes = ('0' + now.getMinutes()).slice(-2);
if (Number(minutes) >= 45) {
	minutes = '30';
} else {
	if (hours == "00") {
		hours = '23';
	} else {
		hours = ('0' + (Number(hours) - 1)).slice(-2);
	}
	minutes = '30';
}
let base_time = hours + minutes;

// 사용자 위치 정보 동의 / 비동의 처리 함수
if (navigator.geolocation) {
	navigator.geolocation.getCurrentPosition(success, error);
} else {
	alert("위치 정보를 동의하시면 현재 기온에 맞는 게시글 확인이 가능합니다.");
}

// 위도 경도 불러오기 성공!
function success(position) {
	let latitude = position.coords.latitude;
	let longitude = position.coords.longitude;

	let rs = dfs_xy_conv("toXY", latitude, longitude);

	const API_KEY = "0pAM3mq68Ft5YCoKoMe5CiXjNZiB9IiJoMUxqUKsMS897TRFS2YC0ra%2BHpo7VZpMrKmqrAGUuA5TPySKNoAAcQ%3D%3D";

	$.ajax({
		url: `http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst?serviceKey=${API_KEY}&numOfRows=60&base_date=${base_date}&base_time=${base_time}&nx=${rs.x}&ny=${rs.y}&dataType=JSON`,
		type: "GET",

		success: function(res) {

			console.log(res);
			let T1H = res.response.body.items.item[24].fcstValue;
			$("#weather-t1h").append("<span>" + T1H + "°C</span>");
			$("#postTemp").attr("value", T1H);
			load_weather_icon(res);
		},

		error: function() {
			alert("날씨 정보를 가져올 수 없습니다..");
			$("#weather-t1h").append("<span>점검중..<span>")
			$("#postTemp").attr("value", null);
			recentPostView();
		}
	})
}

// 위도 경도 불러오기 실패!
function error() {
	alert("위치 정보를 가져올 수 없습니다..");
}

function load_weather_icon(res) {
	let SKY = res.response.body.items.item[18].fcstValue;
	let PTY = res.response.body.items.item[6].fcstValue;

	if (PTY == 0) { // 강수형태 없음
		if (SKY >= 0 && SKY <= 5) { // 하늘상태 맑음
			if (6 < Number(hours) && Number(hours) < 18) {
				$("#weather-sky").append('<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 24 24"><path d="M4.069 13h-4.069v-2h4.069c-.041.328-.069.661-.069 1s.028.672.069 1zm3.034-7.312l-2.881-2.881-1.414 1.414 2.881 2.881c.411-.529.885-1.003 1.414-1.414zm11.209 1.414l2.881-2.881-1.414-1.414-2.881 2.881c.528.411 1.002.886 1.414 1.414zm-6.312-3.102c.339 0 .672.028 1 .069v-4.069h-2v4.069c.328-.041.661-.069 1-.069zm0 16c-.339 0-.672-.028-1-.069v4.069h2v-4.069c-.328.041-.661.069-1 .069zm7.931-9c.041.328.069.661.069 1s-.028.672-.069 1h4.069v-2h-4.069zm-3.033 7.312l2.88 2.88 1.415-1.414-2.88-2.88c-.412.528-.886 1.002-1.415 1.414zm-11.21-1.415l-2.88 2.88 1.414 1.414 2.88-2.88c-.528-.411-1.003-.885-1.414-1.414zm6.312-10.897c-3.314 0-6 2.686-6 6s2.686 6 6 6 6-2.686 6-6-2.686-6-6-6z"/></svg>');
			} else {
				$("#weather-sky").append('<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 24 24"><path d="M12 10.999c1.437.438 2.562 1.564 2.999 3.001.44-1.437 1.565-2.562 3.001-3-1.436-.439-2.561-1.563-3.001-3-.437 1.436-1.562 2.561-2.999 2.999zm8.001.001c.958.293 1.707 1.042 2 2.001.291-.959 1.042-1.709 1.999-2.001-.957-.292-1.707-1.042-2-2-.293.958-1.042 1.708-1.999 2zm-1-9c-.437 1.437-1.563 2.562-2.998 3.001 1.438.44 2.561 1.564 3.001 3.002.437-1.438 1.563-2.563 2.996-3.002-1.433-.437-2.559-1.564-2.999-3.001zm-7.001 22c-6.617 0-12-5.383-12-12s5.383-12 12-12c1.894 0 3.63.497 5.37 1.179-2.948.504-9.37 3.266-9.37 10.821 0 7.454 5.917 10.208 9.37 10.821-1.5.846-3.476 1.179-5.37 1.179z"/></svg>');
			}
		} else if (SKY >= 6 && SKY <= 8) { // 하늘상태 구름많음
			if (6 < Number(hours) && Number(hours) < 18) {
				$("#weather-sky").append('<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 24 24"><path d="M2.396 12h-2.396v-2h2.396v2zm7.604-6.458v-3.542h-2v3.542h2zm-4.793.876l-2.156-2.156-1.414 1.414 2.156 2.156 1.414-1.414zm9.461-2.396l-2.115 2.114 1.414 1.414 2.115-2.114-1.414-1.414zm-11.7 10.907l-2.198 1.919 1.303 1.517 2.198-1.919-1.303-1.517zm21.032 2.793c0 2.362-1.95 4.278-4.354 4.278h-10.292c-2.404 0-4.354-1.916-4.354-4.278 0-.77.211-1.49.574-2.113-.964-.907-1.574-2.18-1.574-3.609 0-2.762 2.238-5 5-5 1.329 0 2.523.528 3.414 1.376.649-.24 1.35-.376 2.086-.376 3.171 0 5.753 2.443 5.921 5.516 2.034.359 3.579 2.105 3.579 4.206zm-18-5.722c0 .86.37 1.628.955 2.172.485-.316 1.029-.551 1.624-.656.088-1.61.843-3.042 1.994-4.046-.46-.288-.991-.47-1.573-.47-1.654 0-3 1.346-3 3z"/></svg>');
			} else {
				$("#weather-sky").append('<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 24 24"><path d="M20.422 11.516c-.169-3.073-2.75-5.516-5.922-5.516-1.229 0-2.368.37-3.313.999-1.041-1.79-2.974-2.999-5.19-2.999-.468 0-.947.054-1.434.167 1.347 3.833-.383 6.416-4.563 5.812-.006 3.027 2.197 5.468 5.02 5.935.104 2.271 1.996 4.086 4.334 4.086h10.291c2.406 0 4.355-1.916 4.355-4.278 0-2.101-1.545-3.847-3.578-4.206zm-15.016 2.439c-1.285-.192-2.384-.997-2.964-2.125 2.916-.119 5.063-2.846 4.451-5.729 1.259.29 2.282 1.18 2.778 2.346-.635.875-1.031 1.928-1.094 3.069-1.419.251-2.588 1.186-3.171 2.439z"/></svg>');
			}
		} else if (SKY >= 9 && SKY <= 10) { // 하늘상태 흐림
			if (6 < Number(hours) && Number(hours) < 18) {
				$("#weather-sky").append('<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 24 24"><path d="M20.422 11.516c-.178-3.233-3.031-5.778-6.432-5.492-1.087-1.239-2.693-2.024-4.49-2.024-3.172 0-5.754 2.443-5.922 5.516-2.033.359-3.578 2.105-3.578 4.206 0 2.362 1.949 4.278 4.354 4.278h1.326c.771 1.198 2.124 2 3.674 2h10.291c2.406 0 4.355-1.916 4.355-4.278 0-2.101-1.545-3.847-3.578-4.206zm-15.395 4.484h-.673c-1.297 0-2.354-1.022-2.354-2.278 0-2.118 2.104-2.597 3.488-2.512-.05-1.356.137-5.21 4.012-5.21.967 0 1.714.25 2.29.644-1.823.922-3.096 2.746-3.212 4.872-2.022.358-3.697 2.127-3.551 4.484z"/></svg>');
			} else {
				$("#weather-sky").append('<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 24 24"><path d="M20.422 11.516c-.178-3.233-3.031-5.778-6.432-5.492-1.087-1.239-2.693-2.024-4.49-2.024-3.172 0-5.754 2.443-5.922 5.516-2.033.359-3.578 2.105-3.578 4.206 0 2.362 1.949 4.278 4.354 4.278h1.326c.771 1.198 2.124 2 3.674 2h10.291c2.406 0 4.355-1.916 4.355-4.278 0-2.101-1.545-3.847-3.578-4.206zm-15.395 4.484h-.673c-1.297 0-2.354-1.022-2.354-2.278 0-2.118 2.104-2.597 3.488-2.512-.05-1.356.137-5.21 4.012-5.21.967 0 1.714.25 2.29.644-1.823.922-3.096 2.746-3.212 4.872-2.022.358-3.697 2.127-3.551 4.484z"/></svg>');
			}
		}
	} else if (PTY == 1) { // 강수형태 비
		if (6 < Number(hours) && Number(hours) < 18) {
			$("#weather-sky").append('<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 24 24"><path d="M5.582 23l-1.41-1.41 3.59-3.59 1.41 1.41-3.59 3.59zm8.543-3.59l-1.41-1.41-3.59 3.59 1.41 1.41 3.59-3.59zm4.875 0l-1.41-1.41-3.59 3.59 1.41 1.41 3.59-3.59zm5-6.688c0 2.362-1.949 4.278-4.355 4.278h-10.291c-1.55 0-2.902-.802-3.674-2h-1.326c-2.405 0-4.354-1.916-4.354-4.278 0-2.101 1.545-3.846 3.578-4.206.168-3.073 2.75-5.516 5.922-5.516 1.797 0 3.403.785 4.49 2.024 3.4-.286 6.254 2.258 6.432 5.492 2.033.359 3.578 2.105 3.578 4.206zm-15.422-4.206c.116-2.126 1.389-3.95 3.212-4.872-.576-.394-1.323-.644-2.29-.644-3.875 0-4.062 3.854-4.012 5.209-1.384-.084-3.488.395-3.488 2.513 0 1.256 1.057 2.278 2.354 2.278h.674c-.147-2.357 1.528-4.126 3.55-4.484z"/></svg>');
		} else {
			$("#weather-sky").append('<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 24 24"><path d="M5.582 23l-1.41-1.41 3.59-3.59 1.41 1.41-3.59 3.59zm8.543-3.59l-1.41-1.41-3.59 3.59 1.41 1.41 3.59-3.59zm4.875 0l-1.41-1.41-3.59 3.59 1.41 1.41 3.59-3.59zm5-6.688c0 2.362-1.949 4.278-4.355 4.278h-10.291c-1.55 0-2.902-.802-3.674-2h-1.326c-2.405 0-4.354-1.916-4.354-4.278 0-2.101 1.545-3.846 3.578-4.206.168-3.073 2.75-5.516 5.922-5.516 1.797 0 3.403.785 4.49 2.024 3.4-.286 6.254 2.258 6.432 5.492 2.033.359 3.578 2.105 3.578 4.206zm-15.422-4.206c.116-2.126 1.389-3.95 3.212-4.872-.576-.394-1.323-.644-2.29-.644-3.875 0-4.062 3.854-4.012 5.209-1.384-.084-3.488.395-3.488 2.513 0 1.256 1.057 2.278 2.354 2.278h.674c-.147-2.357 1.528-4.126 3.55-4.484z"/></svg>');
		}
	} else if (PTY == 2) { // 강수형태 비/눈
		if (6 < Number(hours) && Number(hours) < 18) {
			$("#weather-sky").append('<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 24 24"><path d="M20.422 8.516c-.178-3.233-3.031-5.778-6.432-5.492-1.087-1.239-2.693-2.024-4.49-2.024-3.172 0-5.754 2.443-5.922 5.516-2.033.359-3.578 2.105-3.578 4.206 0 2.362 1.949 4.278 4.354 4.278h1.326c.771 1.198 2.124 2 3.674 2h10.291c2.406 0 4.355-1.916 4.355-4.278 0-2.101-1.545-3.847-3.578-4.206zm-15.395 4.484h-.673c-1.297 0-2.354-1.022-2.354-2.278 0-2.118 2.104-2.597 3.488-2.512-.05-1.356.137-5.21 4.012-5.21.967 0 1.714.25 2.29.644-1.823.922-3.096 2.746-3.212 4.872-2.022.358-3.697 2.127-3.551 4.484zm4.098 6.41l-1.41-1.41-3.59 3.59 1.41 1.41 3.59-3.59zm9.875 0l-1.41-1.41-3.59 3.59 1.41 1.41 3.59-3.59zm-5-.16c0 .69-.559 1.25-1.25 1.25s-1.25-.56-1.25-1.25.559-1.25 1.25-1.25 1.25.56 1.25 1.25zm-3.75 1.25c-.691 0-1.25.56-1.25 1.25s.559 1.25 1.25 1.25 1.25-.56 1.25-1.25-.559-1.25-1.25-1.25z"/></svg>');
		} else {
			$("#weather-sky").append('<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 24 24"><path d="M20.422 8.516c-.169-3.073-2.75-5.516-5.922-5.516-1.229 0-2.368.37-3.313.999-1.041-1.79-2.974-2.999-5.19-2.999-.468 0-.947.054-1.434.167 1.347 3.833-.383 6.416-4.563 5.812-.006 3.027 2.197 5.468 5.02 5.935.104 2.271 1.996 4.086 4.334 4.086h10.291c2.406 0 4.355-1.916 4.355-4.278 0-2.101-1.545-3.847-3.578-4.206zm-15.016 2.439c-1.285-.192-2.384-.997-2.964-2.125 2.916-.12 5.064-2.846 4.452-5.729 1.259.29 2.282 1.18 2.778 2.346-.635.875-1.031 1.928-1.094 3.069-1.42.251-2.589 1.186-3.172 2.439zm3.719 8.455l-1.41-1.41-3.59 3.59 1.41 1.41 3.59-3.59zm9.875 0l-1.41-1.41-3.59 3.59 1.41 1.41 3.59-3.59zm-5-.16c0 .69-.559 1.25-1.25 1.25s-1.25-.56-1.25-1.25.559-1.25 1.25-1.25 1.25.56 1.25 1.25zm-3.75 1.25c-.691 0-1.25.56-1.25 1.25 0 .689.559 1.25 1.25 1.25s1.25-.561 1.25-1.25c0-.69-.559-1.25-1.25-1.25z"/></svg>');
		}
	} else if (PTY == 3) { // 강수형태 눈
		if (6 < Number(hours) && Number(hours) < 18) {
			$("#weather-sky").append('<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 24 24"><path d="M20.422 8.516c-.178-3.232-3.031-5.777-6.432-5.491-1.087-1.24-2.693-2.025-4.49-2.025-3.172 0-5.754 2.443-5.922 5.516-2.033.359-3.578 2.105-3.578 4.206 0 2.362 1.949 4.278 4.354 4.278h1.326c.771 1.198 2.124 2 3.674 2h10.291c2.406 0 4.355-1.916 4.355-4.278 0-2.101-1.545-3.847-3.578-4.206zm-15.395 4.484h-.673c-1.297 0-2.354-1.021-2.354-2.278 0-2.118 2.104-2.597 3.488-2.513-.05-1.355.137-5.209 4.012-5.209.967 0 1.714.25 2.29.645-1.823.921-3.096 2.745-3.212 4.871-2.022.357-3.697 2.127-3.551 4.484zm16.723 6.25c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25zm-4 0c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25zm-4 0c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25zm-4 0c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25zm2 2.5c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25zm4.094 0c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25zm3.906 0c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25z"/></svg>');
		} else {
			$("#weather-sky").append('<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 24 24"><path d="M20.422 8.516c-.169-3.073-2.75-5.516-5.922-5.516-1.229 0-2.368.37-3.313.999-1.041-1.79-2.974-2.999-5.19-2.999-.468 0-.947.054-1.434.167 1.347 3.833-.383 6.417-4.563 5.812-.006 3.027 2.197 5.469 5.02 5.935.104 2.272 1.996 4.086 4.334 4.086h10.291c2.406 0 4.355-1.916 4.355-4.278 0-2.101-1.545-3.847-3.578-4.206zm-15.016 2.439c-1.285-.192-2.384-.998-2.964-2.125 2.916-.119 5.063-2.846 4.451-5.729 1.259.289 2.282 1.18 2.778 2.346-.634.875-1.03 1.928-1.093 3.069-1.42.252-2.589 1.186-3.172 2.439zm16.344 8.295c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25zm-4 0c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25zm-4 0c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25zm-4 0c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25zm2 2.5c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25zm4.094 0c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25zm3.906 0c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25z"/></svg>');
		}
	} else if (PTY == 5) { // 강수형태 빗방울
		if (6 < Number(hours) && Number(hours) < 18) {
			$("#weather-sky").append('<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 24 24"><path d="M20.422 7.516c-.178-3.232-3.031-5.777-6.432-5.491-1.087-1.24-2.693-2.025-4.49-2.025-3.172 0-5.754 2.443-5.922 5.516-2.033.359-3.578 2.105-3.578 4.206 0 2.362 1.949 4.278 4.354 4.278h1.326c.771 1.198 2.124 2 3.674 2h10.291c2.406 0 4.355-1.916 4.355-4.278 0-2.101-1.545-3.847-3.578-4.206zm-15.395 4.484h-.673c-1.297 0-2.354-1.021-2.354-2.278 0-2.118 2.104-2.597 3.488-2.513-.05-1.355.137-5.209 4.012-5.209.967 0 1.714.25 2.29.645-1.823.921-3.096 2.745-3.212 4.871-2.022.357-3.697 2.127-3.551 4.484zm.326 8.933l1.59-1.59.707.707-1.59 1.59-.707-.707zm4.715.699l1.59-1.591-.707-.707-1.59 1.591.707.707zm-2.418-2.996l.707.707 1.635-1.636-.707-.707-1.635 1.636zm-3.004 3.004l-1.646 1.645.707.707 1.646-1.646-.707-.706zm9.425.011l1.591-1.591-.707-.707-1.591 1.591.707.707zm-5.417-.019l-1.654 1.653.707.707 1.654-1.653-.707-.707zm7.008-2.986l.707.707 1.639-1.639-.707-.707-1.639 1.639zm-3.004 3.005l-1.642 1.642.707.707 1.642-1.642-.707-.707z"/></svg>');
		} else {
			$("#weather-sky").append('<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 24 24"><path d="M20.422 7.516c-.169-3.073-2.75-5.516-5.922-5.516-1.229 0-2.368.37-3.313.999-1.041-1.79-2.974-2.999-5.19-2.999-.468 0-.947.054-1.434.167 1.347 3.833-.383 6.417-4.563 5.812-.006 3.027 2.197 5.469 5.02 5.935.104 2.272 1.996 4.086 4.334 4.086h10.291c2.406 0 4.355-1.916 4.355-4.278 0-2.101-1.545-3.847-3.578-4.206zm-11.844 0c-1.42.252-2.589 1.187-3.172 2.439-1.285-.192-2.384-.998-2.964-2.125 2.916-.119 5.063-2.846 4.451-5.729 1.259.289 2.282 1.18 2.778 2.346-.634.875-1.03 1.928-1.093 3.069zm-3.225 13.417l1.59-1.59.707.707-1.59 1.59-.707-.707zm4.715.699l1.59-1.591-.707-.707-1.59 1.591.707.707zm-2.418-2.996l.707.707 1.635-1.636-.707-.707-1.635 1.636zm-3.004 3.004l-1.646 1.645.707.707 1.646-1.646-.707-.706zm9.425.011l1.591-1.591-.707-.707-1.591 1.591.707.707zm-5.417-.019l-1.654 1.653.707.707 1.654-1.653-.707-.707zm7.008-2.986l.707.707 1.639-1.639-.707-.707-1.639 1.639zm-3.004 3.005l-1.642 1.642.707.707 1.642-1.642-.707-.707z"/></svg>');
		}
	} else if (PTY == 6) { // 강수형태 빗방울/눈날림
		if (6 < Number(hours) && Number(hours) < 18) {
			$("#weather-sky").append('<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 24 24"><path d="M20.422 8.516c-.178-3.233-3.031-5.778-6.432-5.492-1.087-1.239-2.693-2.024-4.49-2.024-3.172 0-5.754 2.443-5.922 5.516-2.033.359-3.578 2.105-3.578 4.206 0 2.362 1.949 4.278 4.354 4.278h1.326c.771 1.198 2.124 2 3.674 2h10.291c2.406 0 4.355-1.916 4.355-4.278 0-2.101-1.545-3.847-3.578-4.206zm-15.395 4.484h-.673c-1.297 0-2.354-1.022-2.354-2.278 0-2.118 2.104-2.597 3.488-2.512-.05-1.356.137-5.21 4.012-5.21.967 0 1.714.25 2.29.644-1.823.922-3.096 2.746-3.212 4.872-2.022.358-3.697 2.127-3.551 4.484zm4.098 6.41l-1.41-1.41-3.59 3.59 1.41 1.41 3.59-3.59zm9.875 0l-1.41-1.41-3.59 3.59 1.41 1.41 3.59-3.59zm-5-.16c0 .69-.559 1.25-1.25 1.25s-1.25-.56-1.25-1.25.559-1.25 1.25-1.25 1.25.56 1.25 1.25zm-3.75 1.25c-.691 0-1.25.56-1.25 1.25s.559 1.25 1.25 1.25 1.25-.56 1.25-1.25-.559-1.25-1.25-1.25z"/></svg>');
		} else {
			$("#weather-sky").append('<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 24 24"><path d="M20.422 8.516c-.169-3.073-2.75-5.516-5.922-5.516-1.229 0-2.368.37-3.313.999-1.041-1.79-2.974-2.999-5.19-2.999-.468 0-.947.054-1.434.167 1.347 3.833-.383 6.416-4.563 5.812-.006 3.027 2.197 5.468 5.02 5.935.104 2.271 1.996 4.086 4.334 4.086h10.291c2.406 0 4.355-1.916 4.355-4.278 0-2.101-1.545-3.847-3.578-4.206zm-15.016 2.439c-1.285-.192-2.384-.997-2.964-2.125 2.916-.12 5.064-2.846 4.452-5.729 1.259.29 2.282 1.18 2.778 2.346-.635.875-1.031 1.928-1.094 3.069-1.42.251-2.589 1.186-3.172 2.439zm3.719 8.455l-1.41-1.41-3.59 3.59 1.41 1.41 3.59-3.59zm9.875 0l-1.41-1.41-3.59 3.59 1.41 1.41 3.59-3.59zm-5-.16c0 .69-.559 1.25-1.25 1.25s-1.25-.56-1.25-1.25.559-1.25 1.25-1.25 1.25.56 1.25 1.25zm-3.75 1.25c-.691 0-1.25.56-1.25 1.25 0 .689.559 1.25 1.25 1.25s1.25-.561 1.25-1.25c0-.69-.559-1.25-1.25-1.25z"/></svg>');
		}
	} else if (PTY == 7) { // 강수형태 눈날림
		if (6 < Number(hours) && Number(hours) < 18) {
			$("#weather-sky").append('<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 24 24"><path d="M14 19.25c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25zm-3.75 1.25c-.691 0-1.25.561-1.25 1.25s.559 1.25 1.25 1.25 1.25-.561 1.25-1.25-.559-1.25-1.25-1.25zm8.75-1.25c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25zm-3.75 1.25c-.691 0-1.25.561-1.25 1.25s.559 1.25 1.25 1.25 1.25-.561 1.25-1.25-.559-1.25-1.25-1.25zm-6.25-1.25c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25zm-3.75 1.25c-.691 0-1.25.561-1.25 1.25s.559 1.25 1.25 1.25 1.25-.561 1.25-1.25-.559-1.25-1.25-1.25zm15.172-11.984c-.178-3.232-3.031-5.777-6.432-5.491-1.087-1.24-2.693-2.025-4.49-2.025-3.172 0-5.754 2.443-5.922 5.516-2.033.359-3.578 2.105-3.578 4.206 0 2.362 1.949 4.278 4.354 4.278h1.326c.771 1.198 2.124 2 3.674 2h10.291c2.406 0 4.355-1.916 4.355-4.278 0-2.101-1.545-3.847-3.578-4.206zm-15.395 4.484h-.673c-1.297 0-2.354-1.021-2.354-2.278 0-2.118 2.104-2.597 3.488-2.513-.05-1.355.137-5.209 4.012-5.209.967 0 1.714.25 2.29.645-1.823.921-3.096 2.745-3.212 4.871-2.022.357-3.697 2.127-3.551 4.484z"/></svg>');
		} else {
			$("#weather-sky").append('<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 24 24"><path d="M14 19.25c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25zm-3.75 1.25c-.691 0-1.25.561-1.25 1.25s.559 1.25 1.25 1.25 1.25-.561 1.25-1.25-.559-1.25-1.25-1.25zm8.75-1.25c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25zm-3.75 1.25c-.691 0-1.25.561-1.25 1.25s.559 1.25 1.25 1.25 1.25-.561 1.25-1.25-.559-1.25-1.25-1.25zm-6.25-1.25c0 .689-.559 1.25-1.25 1.25s-1.25-.561-1.25-1.25.559-1.25 1.25-1.25 1.25.561 1.25 1.25zm-3.75 1.25c-.691 0-1.25.561-1.25 1.25s.559 1.25 1.25 1.25 1.25-.561 1.25-1.25-.559-1.25-1.25-1.25zm15.172-11.984c-.169-3.073-2.75-5.516-5.922-5.516-1.229 0-2.368.37-3.313.999-1.041-1.79-2.974-2.999-5.19-2.999-.468 0-.947.054-1.434.167 1.347 3.833-.383 6.417-4.563 5.812-.006 3.027 2.197 5.469 5.02 5.935.104 2.272 1.996 4.086 4.334 4.086h10.291c2.406 0 4.355-1.916 4.355-4.278 0-2.101-1.545-3.847-3.578-4.206zm-15.016 2.439c-1.285-.192-2.384-.998-2.964-2.125 2.916-.119 5.063-2.846 4.451-5.729 1.259.289 2.282 1.18 2.778 2.346-.634.875-1.03 1.928-1.093 3.069-1.42.252-2.589 1.186-3.172 2.439z"/></svg>');
		}
	}
}

// LCC DFS 좌표변환 ( code : "toXY"(위경도->좌표, v1:위도, v2:경도), "toLL"(좌표->위경도,v1:x, v2:y) )
function dfs_xy_conv(code, v1, v2) {
	let DEGRAD = Math.PI / 180.0;
	let RADDEG = 180.0 / Math.PI;

	let re = RE / GRID;
	let slat1 = SLAT1 * DEGRAD;
	let slat2 = SLAT2 * DEGRAD;
	let olon = OLON * DEGRAD;
	let olat = OLAT * DEGRAD;

	let sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
	sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
	let sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
	sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
	let ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
	ro = re * sf / Math.pow(ro, sn);
	let rs = {};
	if (code == "toXY") {
		rs['lat'] = v1;
		rs['lng'] = v2;
		let ra = Math.tan(Math.PI * 0.25 + (v1) * DEGRAD * 0.5);
		ra = re * sf / Math.pow(ra, sn);
		let theta = v2 * DEGRAD - olon;
		if (theta > Math.PI) theta -= 2.0 * Math.PI;
		if (theta < -Math.PI) theta += 2.0 * Math.PI;
		theta *= sn;
		rs['x'] = Math.floor(ra * Math.sin(theta) + XO + 0.5);
		rs['y'] = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);
	}
	else {
		rs['x'] = v1;
		rs['y'] = v2;
		let xn = v1 - XO;
		let yn = ro - v2 + YO;
		ra = Math.sqrt(xn * xn + yn * yn);
		if (sn < 0.0) - ra;
		let alat = Math.pow((re * sf / ra), (1.0 / sn));
		alat = 2.0 * Math.atan(alat) - Math.PI * 0.5;

		if (Math.abs(xn) <= 0.0) {
			theta = 0.0;
		}
		else {
			if (Math.abs(yn) <= 0.0) {
				theta = Math.PI * 0.5;
				if (xn < 0.0) - theta;
			}
			else theta = Math.atan2(xn, yn);
		}
		let alon = theta / sn + olon;
		rs['lat'] = alat * RADDEG;
		rs['lng'] = alon * RADDEG;
	}
	return rs;
}
