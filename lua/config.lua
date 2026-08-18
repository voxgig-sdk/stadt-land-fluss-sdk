-- StadtLandFluss SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "StadtLandFluss",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
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
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "fluss",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "land",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "marke",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "name",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "pflanze",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "stadt",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "tier",
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
                ["parts"] = {
                  "data.json",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
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
