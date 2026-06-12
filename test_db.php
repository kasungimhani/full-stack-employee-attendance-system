<?php
// Simple DB connectivity test using your config
require_once __DIR__ . '/config/database.php';

if (isset($conn) && $conn instanceof mysqli) {
    if ($conn->connect_error) {
        echo "DB connection failed: " . $conn->connect_error . PHP_EOL;
        exit(1);
    }
    echo "DB connected OK. MySQL host: " . $conn->host_info . PHP_EOL;
    // show current DB name
    $res = $conn->query('SELECT DATABASE() AS db');
    $row = $res->fetch_assoc();
    echo "Using database: " . ($row['db'] ?? 'none') . PHP_EOL;
    exit(0);
}

echo "No mysqli connection available." . PHP_EOL;
exit(1);
?>