<?php
// ABOUTME: Cron script to run game automation when no players are online
// ABOUTME: Processes time-based game events to keep the game world running 24/7

define('AUTOMATION_MANUAL_RUN', true);

// Include autoloader from root directory
if (!file_exists(__DIR__ . '/autoloader.php')) {
    die('Error: autoloader.php not found in ' . __DIR__ . "\n");
}
include_once __DIR__ . '/autoloader.php';

// Include configuration and run automation
include_once __DIR__ . '/GameEngine/config.php';
include_once __DIR__ . '/GameEngine/Automation.php';

echo "Cron completed at " . date('Y-m-d H:i:s') . "\n";
