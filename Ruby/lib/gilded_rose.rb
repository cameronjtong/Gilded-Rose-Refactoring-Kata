class GildedRose
  attr_reader :name, :item

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    case name
      when 'Normal Item'
         @item = NormalItem.new(quality, days_remaining)
         item.tick
      when 'Aged Brie'
         @item = AgedBrie.new(quality, days_remaining)
         item.tick
      when "Sulfuras, Hand of Ragnaros"
          @item = Sulfuras.new(quality, days_remaining)
         item.tick
      when "Backstage passes to a TAFKAL80ETC concert"
         @item = Backstage.new(quality, days_remaining)
         item.tick
    end
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

class Item
  attr_reader :quality, :days_remaining

  def initialize(quality, days_remaining)
    @quality, @days_remaining = quality, days_remaining
  end
end

class NormalItem < Item
  def tick
     @days_remaining -= 1
    return if quality == 0
    @quality -= 1
    @quality -= 1 if days_remaining < 0
  end
end

class AgedBrie < Item
  def tick
     @days_remaining -= 1
    return if quality == 50
    @quality += 1
    return if quality == 50
    @quality += 1 if days_remaining < 0
  end
end

class Sulfuras < Item
  def tick
  end
end

class Backstage < Item
  def tick
    @days_remaining -= 1
    return if quality == 50
    @quality += 1
    @quality += 1 if days_remaining < 10
    @quality += 1 if days_remaining < 5
    @quality = 0 if days_remaining < 0
  end
end