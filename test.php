<?php
echo "<html><head></head><body>";
echo "Light Sensor Reading\n";

foreach($_REQUEST as $key => $value) 
{
	if ($key == "brightness") 
	{
		$brightness = $value;
	}

}

if ($brightness < 100)
{
	echo "<p> Light Sensor Value: $brightness. It is dark. </p>\n";
}

else
{
	echo "<p> Light Sensor Value: $brightness. It is bright. </p>\n";
}

echo "</body></html>\n";
?>