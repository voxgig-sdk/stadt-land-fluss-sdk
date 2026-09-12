<?php
declare(strict_types=1);

// StadtLandFluss SDK configuration

class StadtLandFlussConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "StadtLandFluss",
                "slug" => "stadt-land-fluss",
                "version" => "0.0.1",
                "target" => "php",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
          'transport' => 'base',
        ],
            ],
            "options" => [
                "base" => "https://slftool.github.io",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "data" => [],
                ],
            ],
            "entity" => [
        'data' => [
          'fields' => [
            [
              'name' => 'beruf',
              'short' => 'List of professions',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'fluss',
              'short' => 'List of rivers',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'land',
              'short' => 'List of countries',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'marke',
              'short' => 'List of brands',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'name',
              'short' => 'List of names',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'pflanze',
              'short' => 'List of plants',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'stadt',
              'short' => 'List of German cities',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'tier',
              'short' => 'List of animals',
              'type' => '`$ARRAY`',
            ],
          ],
          'name' => 'data',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'args' => [],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/data.json',
                  'segments' => [
                    [
                      'lit' => 'data.json',
                    ],
                  ],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'parts' => [
                    'data.json',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return StadtLandFlussFeatures::make_feature($name);
    }
}
