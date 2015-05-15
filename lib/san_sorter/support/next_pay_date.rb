#TODO: Vomit
class NextPayDate

  FIRST_PAYDAY_DAY = 15
  SECOND_PAYDAY_DAY = 30

  def initialize(date)
    @date = date
  end

  def self.calculate(date = DateTime.now)
    new(date).calculate
  end

  def calculate
    return date if today_is_payday?

    if before_first_payday?
      new_payday_date(FIRST_PAYDAY_DAY)
    elsif between_paydays?
      new_payday_date(SECOND_PAYDAY_DAY)
    else
      if payday_is_next_year?
        new_payday_of_the_next_year
      else
        new_payday_date(FIRST_PAYDAY_DAY, date.year, date.month + 1)
      end
    end
  end

  private
  attr_reader :date

  def new_payday_of_the_next_year
    DateTime.new(date.year + 1, 1, FIRST_PAYDAY_DAY)
  end

  def payday_is_next_year?
    date.month == 12
  end

  def new_payday_date(payday, payyear = date.year, paymonth = date.month)
    DateTime.new(payyear, paymonth, payday)
  end

  def today_is_payday?
    [FIRST_PAYDAY_DAY,SECOND_PAYDAY_DAY].include?(date.day)
  end

  def before_first_payday?
    date.day < FIRST_PAYDAY_DAY
  end

  def between_paydays?
    !before_first_payday? && !after_second_payday?
  end

  def after_second_payday?
    date.day > SECOND_PAYDAY_DAY
  end

end

