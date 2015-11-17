require './test_helper'

class ProductTest < Test::Unit::TestCase

  def test_amount_for_any_products_should_be_same_as_price
    assert_equal(100, Product.new(100).price)
    assert_equal(100, Grocery.new(100).price)
  end

  def test_discountable_amount_for_non_grocery_products_should_be_same_as_price
    assert_equal(100, Product.new(100).discountable_amount)
  end

  def test_discountable_amount_for_grocery_products_should_be_zero
    assert_equal(0, Grocery.new(100).discountable_amount)
  end


end

