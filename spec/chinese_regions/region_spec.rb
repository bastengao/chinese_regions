require 'helper'

require 'chinese_regions/region'

describe ChineseRegions::Region do
  it "load all" do
    provinces = ChineseRegions::Region.load_all
    puts provinces.length
    puts provinces.first
  end
end
