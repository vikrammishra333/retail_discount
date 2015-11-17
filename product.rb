class Product
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def discountable_amount
    @price
  end

end
