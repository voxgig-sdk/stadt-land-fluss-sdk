# StadtLandFluss SDK configuration

module StadtLandFlussConfig
  def self.make_config
    {
      "main" => {
        "name" => "StadtLandFluss",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://slftool.github.io",
        "auth" => {
          "prefix" => "Bearer",
        },
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "data" => {},
        },
      },
      "entity" => {
        "data" => {
          "fields" => [
            {
              "name" => "beruf",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 0,
            },
            {
              "name" => "fluss",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 1,
            },
            {
              "name" => "land",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 2,
            },
            {
              "name" => "marke",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 3,
            },
            {
              "name" => "name",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 4,
            },
            {
              "name" => "pflanze",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 5,
            },
            {
              "name" => "stadt",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 6,
            },
            {
              "name" => "tier",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 7,
            },
          ],
          "name" => "data",
          "op" => {
            "list" => {
              "name" => "list",
              "points" => [
                {
                  "method" => "GET",
                  "orig" => "/data.json",
                  "parts" => [
                    "data.json",
                  ],
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "args" => {},
                  "select" => {},
                  "index$" => 0,
                },
              ],
              "input" => "data",
              "key$" => "list",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    StadtLandFlussFeatures.make_feature(name)
  end
end
