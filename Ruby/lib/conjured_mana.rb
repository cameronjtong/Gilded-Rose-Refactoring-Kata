class ConjuredMana < Item
  def tick
    @days_remaining -= 1
    return if quality == 0
    @quality -= 2
    @quality -= 2 if days_remaining < 0
  end
end