<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<h3>List of Current Residents and their URNs in the Database: </h3>
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "Accommodation";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
 die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT URN, FName, LName FROM Current_Residents";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
	while($row = $result->fetch_assoc()) {
		echo $row["URN"]. " " . $row["FName"]. " " . $row["LName"]. "<br>";
	}
}	else {
	echo "0 results";
}
?>

<h3>List of students from Current Residents who have Course Hours more than average: </h3>
<?php
$sql = "SELECT FName, LName
FROM current_residents
where urn in (select stu_urn from student
where course_hours > (select avg(course_hours) from student));";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
	while($row = $result->fetch_assoc()) {
		echo $row["FName"]. " " . $row["LName"]. "<br>";
	}
}	else {
	echo "0 results";
}
?>

<h3>List of Current Academics: </h3>
<?php
$sql = "SELECT FName, LName
from current_residents
where resident_type = 'academic'
group by FName;";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
	while($row = $result->fetch_assoc()) {
		echo $row["FName"]. " " . $row["LName"]. "<br>";
	}
}	else {
	echo "0 results";
}
?>

<h3>List of Academic's Hire Start Dates: </h3>
<?php
$sql = "SELECT FName, LName, academic.hire_start_date
from current_residents
inner join academic
on current_residents.urn = academic.acad_urn;";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
	while($row = $result->fetch_assoc()) {
		echo $row["FName"]. " " . $row["LName"]. " " . $row["hire_start_date"]. "<br>";
	}
}	else {
	echo "0 results";
}
$conn->close();
?>
</body>
</html>
