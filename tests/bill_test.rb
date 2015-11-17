require './test_helper'

class BillTest < Test::Unit::TestCase

  def test_employee_should_get_30_percent_discount
    bill = Bill.new([Product.new(10)], Employee.new(Date.today))
    assert_equal(7.0, bill.net_payable_amount)
  end

  def test_affiliate_should_get_10_percent_discount
    bill = Bill.new([Product.new(10)], Affiliate.new(Date.today))
    assert_equal(9.0, bill.net_payable_amount)
  end

  def test_customer_older_than_2_years_should_get_5_percent_discount
    bill = Bill.new([Product.new(10)], Customer.new(Date.new(2012, 10, 10)))
    assert_equal(9.5, bill.net_payable_amount)
  end

  def test_customer_newer_than_2_years_should_not_get_any_discount
    bill = Bill.new([Product.new(10)], Customer.new(Date.new(2015, 10, 10)))
    assert_equal(10.0, bill.net_payable_amount)
  end

  def test_every_100_dollar_on_bill_user_should_get_5_dollar_discount
    bill = Bill.new(get_items_worth(990, Product), Customer.new(Date.new(2015, 10, 10)))
    assert_equal(945, bill.net_payable_amount)
  end

  def test_percentage_based_discount_should_not_apply_to_groceries
    bill = Bill.new(get_items_worth(990, Grocery), Customer.new(Date.new(2012, 10, 10)))
    assert_equal(945, bill.net_payable_amount)
  end


  private

    def get_items_worth(price, klass)
      products = []
      product = klass.new(90)
      (product.price..price).step(product.price) {|n| products << product }
      products
    end

end
