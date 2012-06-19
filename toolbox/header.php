<?php

Class Header
{

	public static $title="Sans titre";
	public static $favicon="images/utils/favicon.png";

	function get_title(){
		return self::$title;
	}

	function set_title($title){
		self::$title=$title;
	}
	
	function get_favicon(){
		return self::$favicon;
	}

	function set_favicon($favicon){
		self::$favicon=$favicon;
	}
}

?>
