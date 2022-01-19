require_relative 'item'
require_relative 'normal_item'
require_relative 'aged_brie'
require_relative 'sulfuras'
require_relative 'backstage'

class GildedRose
  attr_reader :item

  def initialize(name:, days_remaining:, quality:)
    @item = klass_for(name).new(quality, days_remaining)
  end

  def klass_for(name)
    case name
      when 'Normal Item'
        NormalItem
      when 'Aged Brie'
        AgedBrie
      when "Sulfuras, Hand of Ragnaros"
        Sulfuras
      when "Backstage passes to a TAFKAL80ETC concert"
        Backstage
    end
  end

  def tick
    item.tick
  end

  def quality
    return item.quality if item
    @quality
  end

  def days_remaining
    return item.days_remaining if item
    @days_remaining
  end
end