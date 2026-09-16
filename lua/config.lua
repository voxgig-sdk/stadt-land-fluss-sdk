-- StadtLandFluss SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "StadtLandFluss",
      slug = "stadt-land-fluss",
      version = "0.0.1",
      target = "lua",
    },
    feature = {
      ["ratelimit"] = {
        ["options"] = {
          ["active"] = false,
          ["burst"] = 5,
          ["rate"] = 5,
        },
        ["optspec"] = {
          ["now"] = "`$FUNCTION`",
          ["sleep"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
      ["retry"] = {
        ["options"] = {
          ["active"] = false,
          ["factor"] = 2,
          ["maxDelay"] = 2000,
          ["minDelay"] = 50,
          ["retries"] = 2,
          ["statuses"] = {
            408,
            425,
            429,
            500,
            502,
            503,
            504,
          },
        },
        ["optspec"] = {
          ["jitter"] = "`$BOOLEAN`",
          ["sleep"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
        ["optspec"] = {
          ["entity"] = "`$MAP`",
          ["net"] = "`$MAP`",
        },
        ["strict"] = false,
        ["transport"] = "base",
      },
      ["timeout"] = {
        ["options"] = {
          ["active"] = false,
          ["ms"] = 30000,
        },
        ["optspec"] = {
          ["clearTimer"] = "`$FUNCTION`",
          ["setTimer"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
    },
    options = {
      base = "https://slftool.github.io",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["data"] = {},
      },
    },
    entity = {
      ["data"] = {
        ["fields"] = {
          {
            ["name"] = "beruf",
            ["short"] = "List of professions",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "fluss",
            ["short"] = "List of rivers",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "land",
            ["short"] = "List of countries",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "marke",
            ["short"] = "List of brands",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "name",
            ["short"] = "List of names",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "pflanze",
            ["short"] = "List of plants",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "stadt",
            ["short"] = "List of German cities",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "tier",
            ["short"] = "List of animals",
            ["type"] = "`$ARRAY`",
          },
        },
        ["name"] = "data",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/data.json",
                ["segments"] = {
                  {
                    ["lit"] = "data.json",
                  },
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "data.json",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
