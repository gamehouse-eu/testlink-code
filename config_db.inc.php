<?php
// Be sure you have all these environment variables defined in your docker-compose.yml
define('DB_TYPE', getenv('DB_TYPE'));
define('DB_USER', getenv('DB_USER'));
define('DB_PASS', getenv('MYSQL_ROOT_PASSWORD'));
define('DB_HOST', getenv('DB_HOST'));
define('DB_NAME', getenv('DB_NAME'));
define('DB_TABLE_PREFIX', getenv('DB_TABLE_PREFIX'));
?>
