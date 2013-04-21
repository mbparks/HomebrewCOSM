<html>
<head>
  <link rel="stylesheet" href="sensor.css">
</head>
<body>

<h1>Light Sensor Log</h1>

<?php
$fp = fopen("sensorLog.txt", "r");
$current_line = fgets($fp);
while (!feof($fp)) {
  // process current line
  $current_line = fgets($fp);
  echo "$current_line<br>";
}
fclose($fp);
?>

</body>
</html>
