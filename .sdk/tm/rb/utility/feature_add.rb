# StadtLandFluss SDK utility: feature_add
module StadtLandFlussUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
