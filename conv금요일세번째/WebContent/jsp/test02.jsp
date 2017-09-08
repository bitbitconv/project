<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>

  <title>button first</title>

  <link rel="stylesheet" href="css/blog.css" />
	<style>
	body {
  font-family: sans-serif;
  line-height: 1.4;
  font-size: 18px;
  padding: 20px;
  padding-bottom: 200px;
  max-width: 640px;
  margin: 0 auto;
}

.post {
  border-top: 1px solid #DDD;
  margin: 60px 0;
}

.post img {
  display: block;
  max-width: 100%;
}

button {
  font-size: 20px;
  padding: 10px 20px;
  border-radius: 5px;
  background: #CCC;
  border: none;
}

.page-load-status {
  display: none; /* hidden by default */
  padding-top: 20px;
  border-top: 1px solid #DDD;
  text-align: center;
  color: #777;
}

/* loader ellips in separate pen CSS */
	
	
	
	</style>
</head>
<body>

<div class="container">
<section id="1">

111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
111<br>
</section>
<section id="2">
222<br>
222<br>
222<br>
222<br>
222<br>
222<br>
222<br>
222<br>
222<br>
222<br>
222<br>
222<br>
222<br>
222<br>
222<br>
222<br>
222<br>
222<br>
222<br>
222<br>
222<br>
222<br>
</section>
<section id="3">
333<br>
333<br>
333<br>
333<br>
333<br>
333<br>
333<br>
333<br>
333<br>
333<br>
333<br>
333<br>
333<br>
333<br>
</section>
<section id="4">
444<br>
444<br>
444<br>
444<br>
444<br>
444<br>
444<br>
444<br>
444<br>
444<br>
444<br>
444<br>
444<br>
444<br>
444<br>
</section>
</div>
	<div class="w3-center">
	  <button class="cha">이동하기</button>  
	</div>




<script>
var nextPenSlugs = [
	  '#1',
	  '#2',
	  '#3',
	  '#4'
	];

	function getPenPath() {
	  var slug = nextPenSlugs[ this.loadCount ];
	  if ( slug ) {
	    return 'http://localhost:8000/conv/jsp/test02.jsp' + slug;
	  }
	}

	//-------------------------------------//
	// init Infinite Scroll

	$('.container').infiniteScroll({
	  path: getPenPath,
	  button: '.cha',
	  // using button, disable loading on scroll 
	  scrollThreshold: false,
	});

</script>

</body>
</html>