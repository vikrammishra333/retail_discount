class User
  attr_reader :joining_date

  def initialize(joining_date)
    @joining_date = joining_date
  end

  def discount_percentage
    raise NotImplementedError, "This method must be overrided"
  end

end
