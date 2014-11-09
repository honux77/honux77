<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="shortcut icon" href="assets/ico/favicon.ico">
</head>
<body>
<?php
	$host = "localhost";
	$user = "honux";
	$password = "popi1004";
	$db = "honux77";

	$conn = new mysqli($host, $user, $password, $db);

	if ($conn->connect_error) {
		die("Connection failed: ". $conn->connect_error);
	}

	$sql = "SELECT msg FROM welcome";
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
		while ($row = $result->fetch_assoc()) {
			echo "<h1>" .$row["msg"]. "</h1>\n";
		}
	} else {
		echo "Honux Home: DBMS Error";
	}

	$conn->close();
?>
</body>
</html>
