<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="shortcut icon" href="assets/ico/favicon.ico">

	<title>Honux Academy</title>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">


	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>

<?php include 'db.php'; ?>

<!-- start body page -->
	<body>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
	<div class="navbar-header">
	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</button>
	<a class="navbar-brand" href="index.php">Honux.net</a>
	</div>
	<div id="navbar" class="navbar-collapse collapse">
		<ul class="nav navbar-nav navbar-right">
		<li><a href="index.php">Home</a></li>
		<li><a href="http://honux77.wordpress.com">Blog</a></li>
		<li class="active"><a href="#">Lecture</a></li>
		</ul>
	</div><!--/.nav-collapse -->
	</div>
	</nav>

	<!-- jumpotron -->
	<div class="jumbotron">
	<div class="container">
	<h1>Hello, code. </h1>
<?
if ($conn->connect_error) {
	die("Connection failed: ". $conn->connect_error);
}
$sql = "SELECT msg FROM welcome where page='lecture'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
	while ($row = $result->fetch_assoc()) {
		echo "<p>" .$row["msg"]. "</p>\n";
	}
} else {
	echo "Honux Home: DBMS Error";
}
?>
</div>
	</div>

	<!-- courses' info -->
	<div class="container">
	<div class="row">
	<!-- course template form
	<div class="col-md-4"> 
	<h2>데이터베이스 베이직</h2>
	<p>짱짱 재미있는 데이터베이스 베이직</p>
	<a class="btn btn-default" href="#" role="button">
	바로가기/a>
	</div>
	-->
<?
$sql = "SELECT cid,cname,course_desc FROM course";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
	while ($row = $result->fetch_assoc()) {
		echo '<div class="col-md-4">';
		echo "<h2>" .$row["cname"]. "</h2>\n";
		echo "<p>" .$row["course_desc"]. "</p>\n";
		echo '<a class="btn btn-sm btn-warning" href=course.php?cid='.$row["cid"];
		echo ' role="button">';
		echo "바로가기</a>\n";
		echo "</div>\n";
	}
} else {
	echo "Honux Home: DBMS Error";
}
?>
	</div> 
</div>

<?
$conn->close();
?>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>
</html>
