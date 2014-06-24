require 'json'

module ChineseRegions
  class Region
    attr_reader :parent_code, :code, :level, :name, :name_alias, :pinyin, :abbr, :zip, :children

    class << self

      def flat
        regions = []
        load_all.each do |region|
          deep_retrieve regions, region
        end

        regions
      end

      def deep_retrieve regions, region
        regions << region
        region.children.each {|r| deep_retrieve regions, r} if region.children
      end

      def load_all
        provinces_hash = read_json("index.json")

        provinces = provinces_hash.collect { |p_hash| Region.new(p_hash) }
        provinces.each { |p| p.load_children }
        return provinces
      end

      def read_json(file)
        json_base_dir = File.expand_path("../../json", __FILE__)
        json_index = File.expand_path(file, json_base_dir)
        JSON.parse(File.read json_index)
      end
    end


    def initialize(region_hash, parent_code = nil, level = 1)
      @parent_code = parent_code
      @level = level
      @code = region_hash['i']
      @name = region_hash['n']
      @name_alias = region_hash['a']
      @pinyin = region_hash['y']
      @abbr = region_hash['b']
      @zip = region_hash['z']

      if region_hash['c']
        @children = region_hash['c'].collect {|c_hash| Region.new(c_hash, @code, @level + 1) }
      end
    end

    def load_children
      cities_hash = Region.read_json("#{@code}.json")
      @children = cities_hash.collect {|c_hash| Region.new(c_hash, @code, @level + 1) }
    end

    def to_s
      "code: #{@code}, parent_code: #{@parent_code}, level: #{@level}, name: #{@name}"
    end


  end
end