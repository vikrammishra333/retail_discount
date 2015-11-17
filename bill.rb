class Bill

  DISCOUNT_RATE_PER_100 = 5

  def initialize(products, user)
    @products = products
    @user = user
  end

  def net_payable_amount
    total_billable_amount - bill_discount - user_specific_discount
  end

  private

    def bill_discount
      (total_billable_amount / 100) * DISCOUNT_RATE_PER_100
    end

    def get_discountable_amount
      discountable_amount = 0
      @products.each { |product| discountable_amount += product.discountable_amount }
      discountable_amount
    end

    def total_billable_amount
      billable_amount = 0
      @products.each { |product| billable_amount += product.price }
      billable_amount
    end

    def user_specific_discount
      get_discountable_amount.to_f * @user.discount_percentage / 100
    end

end
