<?php
declare(strict_types=1);

// StadtLandFluss SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class StadtLandFlussFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new StadtLandFlussBaseFeature();
            case "test":
                return new StadtLandFlussTestFeature();
            default:
                return new StadtLandFlussBaseFeature();
        }
    }
}
