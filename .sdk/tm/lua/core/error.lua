-- StadtLandFluss SDK error

local StadtLandFlussError = {}
StadtLandFlussError.__index = StadtLandFlussError


function StadtLandFlussError.new(code, msg, ctx)
  local self = setmetatable({}, StadtLandFlussError)
  self.is_sdk_error = true
  self.sdk = "StadtLandFluss"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function StadtLandFlussError:error()
  return self.msg
end


function StadtLandFlussError:__tostring()
  return self.msg
end


return StadtLandFlussError
