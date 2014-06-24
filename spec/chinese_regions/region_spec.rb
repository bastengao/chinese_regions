require 'helper'

require 'chinese_regions/region'

describe ChineseRegions::Region do
  it "load all" do
    provinces = ChineseRegions::Region.provinces
    puts provinces.length
  end

  it "flat" do
    regions = ChineseRegions::Region.flat
    puts regions[0..10]
    puts regions.size
  end
end
