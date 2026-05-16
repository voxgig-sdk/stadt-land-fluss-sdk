# StadtLandFluss SDK utility: make_context
require_relative '../core/context'
module StadtLandFlussUtilities
  MakeContext = ->(ctxmap, basectx) {
    StadtLandFlussContext.new(ctxmap, basectx)
  }
end
