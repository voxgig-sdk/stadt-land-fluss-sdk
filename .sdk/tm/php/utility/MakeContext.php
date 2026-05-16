<?php
declare(strict_types=1);

// StadtLandFluss SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class StadtLandFlussMakeContext
{
    public static function call(array $ctxmap, ?StadtLandFlussContext $basectx): StadtLandFlussContext
    {
        return new StadtLandFlussContext($ctxmap, $basectx);
    }
}
