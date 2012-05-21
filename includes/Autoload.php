<?php
function __autoload($name) 
{
    if(file_exists(CLASSES . "/$name.class.php"))
    	require_once( CLASSES . "/$name.class.php");
    else if(file_exists("includes/$name.class.php"))
    	require_once("includes/$name.class.php");
}
?>
