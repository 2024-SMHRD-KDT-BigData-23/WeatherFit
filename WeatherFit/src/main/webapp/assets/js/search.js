function search(target) {
    var word = target.value;
    var encodeWord = encodeURI(word);
    console.log(word);
    console.log(encodeWord);

    $.ajax({
        url: "서블릿으로 보내기",
        type: "GET",
        dataType: "json",

        success: function (data) {
            console.log("data확인 : " + data);
            console.log("결과 개수 : " + data.dataSearch.content.length);
            console.log("첫번째 결과 : " + data.dataSearch.content[0]);
            $("#search-list").empty();
            var checkWord = $("#word").val();
            console.log(data.dataSearch.content.length);
            if (checkWord.length > 0 && data.dataSearch.content.length > 0) {
                for (i = 0; i < data.dataSearch.content.length; i++) {
                    $("#search-list").append("<li class='search-list' value='" + data.dataSearch.content[i].schoolName + "' data-input='" + data.dataSearch.content[i].schoolName + ">" + "<a href='javascript:void(0); '>" + data.dataSearch.content[i].schoolName + "</a>" + "</li>");
                }
            }
        },

        error: function (err) {
            console.log("검색 중 오류 발생");
        }
    })
}

$("#search").on("keyup", search(this));