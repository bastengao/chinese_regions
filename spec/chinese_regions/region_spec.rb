require 'helper'

require 'chinese_regions/region'

describe ChineseRegions::Region do
  it "load all" do
    provinces = ChineseRegions::Region.load_all
    puts provinces.length
  end

  it "flat" do
    regions = ChineseRegions::Region.flat
    puts regions[0..80]
    puts regions.size
  end
end
