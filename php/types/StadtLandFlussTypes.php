<?php
declare(strict_types=1);

// Typed models for the StadtLandFluss SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Data entity data model. */
class Data
{
    public ?array $beruf = null;
    public ?array $fluss = null;
    public ?array $land = null;
    public ?array $marke = null;
    public ?array $name = null;
    public ?array $pflanze = null;
    public ?array $stadt = null;
    public ?array $tier = null;
}

/** Request payload for Data#list. */
class DataListMatch
{
    public ?array $beruf = null;
    public ?array $fluss = null;
    public ?array $land = null;
    public ?array $marke = null;
    public ?array $name = null;
    public ?array $pflanze = null;
    public ?array $stadt = null;
    public ?array $tier = null;
}

