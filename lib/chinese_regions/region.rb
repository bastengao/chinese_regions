require 'json'

module ChineseRegions
  class Region
    def self.load_all
      json_dir = File.expand_path("../../json", __FILE__)
      json_index = File.expand_path("index.json", json_dir)
      provinces_hash = JSON.parse(File.read json_index)

      provinces = provinces_hash.collect { |p_hash| Region.new p_hash }
      return provinces
    end

    def initialize(region_hash, parent_code = nil)
      @parent_code = parent_code
      @code = region_hash['i']
      @name = region_hash['n']
      @name_alias = region_hash['a']
      @pinyin = region_hash['y']
      @abbr = region_hash['b']
      @zip = region_hash['z']
    end

    def to_s
      "code: #{@code}, name: #{@name}"
    end


  end
end