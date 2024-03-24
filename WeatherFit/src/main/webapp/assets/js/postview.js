


(function() {
	$.ajax({
		url: "Posts",
		type: "get",
		dataType: "json",
		success: function(posts) {


			console.log(posts);
			str = '<div class = "col">';
			$.each(posts, function(i) {
				str += '<TD>' + posts[i].postIdx + '</TD>'
				str += '<TD>' + posts[i].postContent + '</TD>'
				str += '</TR>'
			});
			$("#ajaxtext").append(str);

			let ajaxcontent =`
				<div class="col-md-4">
					<div class="card shadow-sm">
						<svg class="bd-placeholder-img card-img-top" width="100%"
							height="225" xmlns="http://www.w3.org/2000/svg" role="img"
							aria-label="Placeholder: Thumbnail"
							preserveAspectRatio="xMidYMid slice" focusable="false">
							<title>Placeholder</title>
							<rect width="100%" height="100%" fill="#55595c" />
							<text x="50%" y="50%" fill="#eceeef" dy=".3em">`+posts[0].hashTag+`</text>
						</svg>
						<div class="card-body">
							<p class="card-text">`+ posts[0].postContent +`</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
									<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
								</div>
								<small class="text-body-secondary">9 mins</small>
							</div>
						</div>
					</div>
				</div>`;

		for (let i = 0; i < 30; i++) {
        $('#ajaxcontainer').append(`
				<div class="col-md-4" href="gopostdetail.do">
					<div class="card shadow-sm">
						<svg class="bd-placeholder-img card-img-top" width="100%"
							height="225" xmlns="http://www.w3.org/2000/svg" role="img"
							aria-label="Placeholder: Thumbnail"
							preserveAspectRatio="xMidYMid slice" focusable="false">
							<title>Placeholder</title>
							<rect width="100%" height="100%" fill="#55595c" />
							<text x="50%" y="50%" fill="#eceeef" dy=".3em">`+posts[i].hashTag+`</text>
						</svg>
						<div class="card-body">
							<p class="card-text">`+ posts[i].postContent +`</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
									<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
								</div>
								<small class="text-body-secondary">`+ posts[i].createdAt +`</small>
							</div>
						</div>
					</div>
				</div>`
			
		);
    }



		},
		error: function(err) {
			console.log("연결 실패");
		}
	})
}());
