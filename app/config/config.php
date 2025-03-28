<?php

# Database link credentials
define ("DBNAME", "webapp");
define ("DBUSER", "root");
define ("DBPASS", "");
define ("DBHOST", "localhost");

# PATH to app and app name
define ("PATH", "mvc-php");
define ("WEB_TITLE", "Web app");

# PATH to media files and site root constants
define ("SITE_ROOT", "/" . PATH);
define ("MEDIA", "/" . "common");
define ("HTML", "common" . DS . "html");

# Default states
define ("DEFAULT_CONTROLLER", "page");
define ("DEFAULT_METHOD", "home");
define ("NOT_FOUND", "not_found");

?>
