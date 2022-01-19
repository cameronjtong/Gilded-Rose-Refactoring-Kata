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