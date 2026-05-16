<?php
declare(strict_types=1);

// StadtLandFluss SDK configuration

class StadtLandFlussConfig
{
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "StadtLandFluss",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://slftool.github.io",
                "auth" => [
                    "prefix" => "Bearer",
                ],
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
              'req' => false,
              'type' => '`$ARRAY`',
              'active' => true,
              'index$' => 0,
            ],
            [
              'name' => 'fluss',
              'req' => false,
              'type' => '`$ARRAY`',
              'active' => true,
              'index$' => 1,
            ],
            [
              'name' => 'land',
              'req' => false,
              'type' => '`$ARRAY`',
              'active' => true,
              'index$' => 2,
            ],
            [
              'name' => 'marke',
              'req' => false,
              'type' => '`$ARRAY`',
              'active' => true,
              'index$' => 3,
            ],
            [
              'name' => 'name',
              'req' => false,
              'type' => '`$ARRAY`',
              'active' => true,
              'index$' => 4,
            ],
            [
              'name' => 'pflanze',
              'req' => false,
              'type' => '`$ARRAY`',
              'active' => true,
              'index$' => 5,
            ],
            [
              'name' => 'stadt',
              'req' => false,
              'type' => '`$ARRAY`',
              'active' => true,
              'index$' => 6,
            ],
            [
              'name' => 'tier',
              'req' => false,
              'type' => '`$ARRAY`',
              'active' => true,
              'index$' => 7,
            ],
          ],
          'name' => 'data',
          'op' => [
            'list' => [
              'name' => 'list',
              'points' => [
                [
                  'method' => 'GET',
                  'orig' => '/data.json',
                  'parts' => [
                    'data.json',
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'active' => true,
                  'args' => [],
                  'select' => [],
                  'index$' => 0,
                ],
              ],
              'input' => 'data',
              'key$' => 'list',
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
