var news = {}
var container = document.getElementById("img");

news.Open = function(data) {
	container.style.visibility = "visible";
}

news.Close = function() {
	container.style.visibility = "hidden";
	$.post(`https://${GetParentResourceName()}/close`);
}

function changePage(pageImage) {
	var str = pageImage.src;
	var pageNum = str.substring(str.indexOf("page") + 4, str.lastIndexOf("."));
	pageNext = Number(pageNum) + 1;
	pageImage.src = pageImage.src.replace("page" + pageNum, "page" + pageNext);		
}
//Note that the onerror switch back to "page1" is in the html file

$(document).ready(function(){
  window.addEventListener('message', function(event) {
		switch(event.data.action) {
			case "open":
				news.Open(event.data);
				break;
			case "close":
				news.Close();
				break;
		}
	})
});

$(document).on('keydown', function() {
	switch(event.keyCode) {
		case 27: // ESC
			news.Close();
			break;
	}
});