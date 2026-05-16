package = "voxgig-sdk-stadt-land-fluss"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/stadt-land-fluss-sdk.git"
}
description = {
  summary = "StadtLandFluss SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["stadt-land-fluss_sdk"] = "stadt-land-fluss_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
