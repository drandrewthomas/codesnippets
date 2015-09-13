<?php
  /*
    Based on IP geocoder: Tom Igoe, 2007
    Making Things Talk, O'Reilly Press
  */
  $lat=0;
  $long=0;
  $ipAddress=$_REQUEST['ip'];
  $country="unknown";
  $IpLocatorUrl="http://api.hostip.info/get_html.php?&position=true&ip=";
  $IpLocatorUrl=$IpLocatorUrl.$ipAddress;
  $filePath=fopen($IpLocatorUrl,"r");
  while(!feof($filePath))
  {
    $line=fgetss($filePath,4096);
    $fragments=explode(":",$line);
    switch($fragments[0])
    {
      case "Country":
        $country=trim($fragments[1]);
        break;
      case "City":
        $city=trim($fragments[1]);
        break;
      case "Latitude":
        $lat=trim($fragments[1]);
        break;
      case "Longitude":
        $long=trim($fragments[1]);
        break;
    }
  }
  fclose($filePath);
  echo "<START>";
  echo "$lat,$long,$country,$city";
  echo "<END>";
?>
