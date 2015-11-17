require './test_helper'

class UserTest < Test::Unit::TestCase

  def test_discount_percentage
    assert_equal(30.0, Employee.new(Date.today).discount_percentage)
    assert_equal(10.0, Affiliate.new(Date.today).discount_percentage)
    assert_equal(5.0, Customer.new(Date.new(2012, 10, 10)).discount_percentage)
    assert_equal(0.0, Customer.new(Date.today).discount_percentage)
  end

end
