
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



<script type="text/javascript" src="/conv/lib/jquery-3.2.1.js">
	// init controller
	var controller = new ScrollMagic.Controller();

	// build scene
	var scene = new ScrollMagic.Scene({triggerElement: ".dynamicContent #loader", triggerHook: "onEnter"})
					.addTo(controller)
					.on("enter", function (e) {
						if (!$("#loader").hasClass("active")) {
							$("#loader").addClass("active");
							if (console){
								console.log("loading new items");
							}
							// simulate ajax call to add content using the function below
							setTimeout(addBoxes, 1000, 9);
						}
					});

	// pseudo function to add new content. In real life it would be done through an ajax request.
	
	function addBoxes (amount) {
		for (i=1; i<=amount; i++) {
			var randomColor = '#'+('00000'+(Math.random()*0xFFFFFF<<0).toString(16)).slice(-6);
			$("<div></div>")
				.addClass("box1")
				.css("background-color", randomColor)
				.appendTo(".dynamicContent #content");
		}
		// "loading" done -> revert to normal state
		scene.update(); // make sure the scene gets the new start position
		$("#loader").removeClass("active");
	}

	// add some boxes to start with.
	addBoxes(18);
</script>


</head>
<body>

	<div id="content">

		<div class="box1" style="background-color: rgb(105, 77, 135);"></div>
		<div class="box1" style="background-color: rgb(204, 62, 60);"></div>
		<div class="box1" style="background-color: rgb(193, 111, 69);"></div>
		<div class="box1" style="background-color: rgb(178, 34, 161);"></div>
		<div class="box1" style="background-color: rgb(110, 172, 95);"></div>
		<div class="box1" style="background-color: rgb(230, 4, 79);"></div>
		<div class="box1" style="background-color: rgb(55, 114, 104);"></div>
		<div class="box1" style="background-color: rgb(162, 186, 16);"></div>
		<div class="box1" style="background-color: rgb(14, 130, 156);"></div>
		<div class="box1" style="background-color: rgb(6, 138, 78);"></div>
		<div class="box1" style="background-color: rgb(169, 243, 178);"></div>
		<div class="box1" style="background-color: rgb(134, 210, 105);"></div>
		<div class="box1" style="background-color: rgb(9, 203, 168);"></div>
		<div class="box1" style="background-color: rgb(48, 56, 123);"></div>
		<div class="box1" style="background-color: rgb(163, 91, 234);"></div>
		<div class="box1" style="background-color: rgb(42, 255, 153);"></div>
		<div class="box1" style="background-color: rgb(176, 46, 198);"></div>
		<div class="box1" style="background-color: rgb(25, 245, 17);"></div>
	</div>
	<div id="loader">
		<img src="../../img/example_loding.gif"> LOADING...
	</div>

</body>
</html>