<?php
declare(strict_types=1);

// StadtLandFluss SDK exists test

require_once __DIR__ . '/../stadtlandfluss_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = StadtLandFlussSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
