<?php
declare(strict_types=1);

// StadtLandFluss SDK utility: feature_add

class StadtLandFlussFeatureAdd
{
    public static function call(StadtLandFlussContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
