<?php

declare(strict_types=1);

$root = dirname(__DIR__);
$link = $root.'/public/assets';
$target = $root.'/assets';

if (file_exists($link) || ! is_dir($target) || ! function_exists('symlink')) {
    return;
}

@symlink(realpath($target), $link);
