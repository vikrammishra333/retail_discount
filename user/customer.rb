class Customer < User

  def discount_percentage
    is_older_than_2_years? ? 5 : 0
  end

  private
    def is_older_than_2_years?
      (Date.today - joining_date) > 2*365
    end

end

