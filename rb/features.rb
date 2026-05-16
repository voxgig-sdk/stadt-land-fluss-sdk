# StadtLandFluss SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module StadtLandFlussFeatures
  def self.make_feature(name)
    case name
    when "base"
      StadtLandFlussBaseFeature.new
    when "test"
      StadtLandFlussTestFeature.new
    else
      StadtLandFlussBaseFeature.new
    end
  end
end
