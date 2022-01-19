require_relative 'item'
require_relative 'normal_item'
require_relative 'aged_brie'
require_relative 'sulfuras'
require_relative 'backstage'

SPECIALIZED_ITEMS = {
  'Aged Brie' => AgedBrie,
  'Sulfuras, Hand of Ragnaros' => Sulfuras,
  'Backstage passes to a TAFKAL80ETC concert' => Backstage
}

class GildedRose
  attr_reader :item

  def initialize(name:, days_remaining:, quality:)
    @item = (SPECIALIZED_ITEMS[name] || NormalItem).new(quality, days_remaining)
  end

  def tick
    item.tick
  end

  def quality
    item.quality
  end

  def days_remaining
    item.days_remaining
  end
end