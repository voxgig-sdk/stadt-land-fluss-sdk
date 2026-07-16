<?php
declare(strict_types=1);

// StadtLandFluss SDK base feature

class StadtLandFlussBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(StadtLandFlussContext $ctx, array $options): void {}
    public function PostConstruct(StadtLandFlussContext $ctx): void {}
    public function PostConstructEntity(StadtLandFlussContext $ctx): void {}
    public function SetData(StadtLandFlussContext $ctx): void {}
    public function GetData(StadtLandFlussContext $ctx): void {}
    public function GetMatch(StadtLandFlussContext $ctx): void {}
    public function SetMatch(StadtLandFlussContext $ctx): void {}
    public function PrePoint(StadtLandFlussContext $ctx): void {}
    public function PreSpec(StadtLandFlussContext $ctx): void {}
    public function PreRequest(StadtLandFlussContext $ctx): void {}
    public function PreResponse(StadtLandFlussContext $ctx): void {}
    public function PreResult(StadtLandFlussContext $ctx): void {}
    public function PreDone(StadtLandFlussContext $ctx): void {}
    public function PreUnexpected(StadtLandFlussContext $ctx): void {}
}
