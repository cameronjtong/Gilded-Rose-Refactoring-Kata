class AgedBrie < Item
  def tick
     @days_remaining -= 1
    return if quality == 50
    @quality += 1
    return if quality == 50
    @quality += 1 if days_remaining < 0
  end
end