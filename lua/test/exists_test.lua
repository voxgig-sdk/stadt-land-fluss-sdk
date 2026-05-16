-- ProjectName SDK exists test

local sdk = require("stadt-land-fluss_sdk")

describe("StadtLandFlussSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
