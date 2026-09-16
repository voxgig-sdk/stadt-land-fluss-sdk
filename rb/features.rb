# StadtLandFluss SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module StadtLandFlussFeatures
  def self.make_feature(name)
    case name
    when "base"
      StadtLandFlussBaseFeature.new
    when "ratelimit"
      StadtLandFlussRatelimitFeature.new
    when "retry"
      StadtLandFlussRetryFeature.new
    when "test"
      StadtLandFlussTestFeature.new
    when "timeout"
      StadtLandFlussTimeoutFeature.new
    else
      StadtLandFlussBaseFeature.new
    end
  end
end
