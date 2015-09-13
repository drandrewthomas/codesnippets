<?php
  srand(time());
  echo "<START>";
  $it=(rand()%98)+2;
  for($c=1; $c<$it; $c++)
  {
    echo rand()%100;
    echo ",";
  }
  echo rand()%100;
  echo "<END>";
?>

