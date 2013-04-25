<?php
echo "<html><head></head><body>";
echo "Light Sensor Reading\n";

$sensorLogFile = "sensorLog.txt";
$maxLines = 160; // Number of lines to remove
$linecount = 0;



$fh = fopen($sensorLogFile, "r");
while(!feof($fh)){
  $line = fgets($fh);
  $linecount++;
}
fclose($fh);
echo "<p> Line Count: $linecount </p>\n";




if ($linecount > 160)
{
    $lines = file($sensorLogFile);
	$lines = array_slice($lines, $linecount - 160, $linecount);
	$fh= fopen($sensorLogFile, 'w');
    fwrite($fh, implode('', $lines));
    fclose($fh);
}




$fh = fopen($sensorLogFile, 'a') or die("Can't open file");
foreach($_REQUEST as $key => $value) 
{
	if ($key == "brightness") 
	{
		$brightness = $value;
	}
}

$dateTime = new DateTime();
$dateTimeStamp = $dateTime->format('Y-m-d H:i:s');
$stringData = $dateTimeStamp . ": " . $brightness . "\n";
fwrite($fh, $stringData);
fclose($fh);


if ($brightness < 100)
{
	echo "<p> $dateTimeStamp: Light Sensor Value: $brightness. It is dark. </p>\n";
}

else
{
	echo "<p> $dateTimeStamp: Light Sensor Value: $brightness. It is bright. </p>\n";
}

echo "</body></html>\n";
?>