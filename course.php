<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="assets/ico/favicon.ico">

<title>Honux Academy</title>
<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<!-- dashboard css -->
<link rel="stylesheet" href="assets/css/dashboard.css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<?php include 'db.php'; ?>

<!-- start body page -->
<body role="document">

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
	  <a class="navbar-brand" href="#">Honux.net</a>
	</div>
	<div id="navbar" class="navbar-collapse collapse">
	  <ul class="nav navbar-nav navbar-right">
		<li><a href="index.php">Home</a></li>
		<li><a href="http://honux77.wordpress.com">Blog</a></li>
		<li class="active"><a href="lecture.php">Lecture</a></li>
	  </ul>
	</div><!--/.nav-collapse -->
  </div>
</nav>

<!-- sidebar for lecture -->
<?php
	$fail = False;
	$cid = $_GET['cid'];
	$lid = $_GET['lid'];
	$cname = "honux";
	$lname = "code";
	if ($cid == null) $cid = 1;
	if ($lid == null) $lid = 1;
	$sql = 'SELECT cname FROM course WHERE cid='.$cid;
	$result= $conn->query($sql);
	$row = $result->fetch_assoc();
	$cname = $row['cname'];
	$query = 'SELECT lid,line,lname FROM lecture  WHERE cid='.$cid.' order by line';
	$result = $conn->query($query);
?>

<div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
<?php
	if($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) {
			$link = "course.php?cid=".$cid."&&lid=".$row['lid'];
			if($lid == $row["lid"]) {
				$lname = $row['lname'];
				echo '<li class="active"><a href="#">'.$row["lname"].'</a></li>'; 
			}
			else
			echo '<li><a href="'.$link.'">'.$row["lname"].'</a></li>'; 
		}
	}
?>
          </ul>
        </div>

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
<!-- title -->
<?php
		echo '<h3 class="page-header">'.$cname.' - '.$lname.'</h3>';
?>
		
<!-- body -->
		<div id="lecture-body">
	lecture body
<?
	$sql = "SELECT html FROM lecture WHERE lid=".$lid;
	$row = $conn->query($sql)->fetch_assoc();
	$html = $row['html'];
	echo $html;
?>
		</div>

<?
	$conn->close();
?>
<div id="disqus_thread"></div>
    <script type="text/javascript">
        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        var disqus_shortname = 'honux'; // required: replace example with your forum shortname

        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function() {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
    <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
    
	</div> 
</div>
 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</body>
</html>
