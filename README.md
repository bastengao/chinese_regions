## chinese_regions

中国省市区县数据库，包含 行政编码，邮政编码，地区拼音和简拼。 数据来源 https://github.com/xixilive/chinese_regions_db

### 安装

```
gem install chinese_regions
```

### 使用

```ruby
require 'chinese_regions'


provinces = ChineseRegions::Region.load_all

regions = ChineseRegions::Region.flat
```

Region 包含的属性

* parent_code
* code
* level
* name
* name_alias
* pinyin
* abbr
* zip
* children => Region

