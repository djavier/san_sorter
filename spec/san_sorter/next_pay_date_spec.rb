require 'spec_helper'

#TODO: VOMIT
class NextPayDate

  FIRST_PAYDAY_DAY = 15
  SECOND_PAYDAY_DAY = 30

  def initialize(date)
    @date = date
  end

  def self.calculate(date)
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

describe NextPayDate do

  describe ".calculate" do

    context "when today is the first paydate" do

      let(:current_date) { DateTime.new(2015,11,15) }

      it "should return the 15th when we are on the 15th" do
        next_pay_date = described_class.calculate(current_date)

        expect(next_pay_date.year).to eql(2015)
        expect(next_pay_date.month).to eql(11)
        expect(next_pay_date.day).to eql(15)
      end
    end

    context "when the today is the second payment" do

      let(:current_date) { DateTime.new(2015,11,30) }

      it "should return the 30th when we are on the 30th" do
        next_pay_date = described_class.calculate(current_date)

        expect(next_pay_date.year).to eql(2015)
        expect(next_pay_date.month).to eql(11)
        expect(next_pay_date.day).to eql(30)
      end
    end

    context "when today is before the first paydate (15)" do

      let(:current_date) { DateTime.new(2015,12,31) }

      it "should return the next paydate as the 15th" do
        next_pay_date = described_class.calculate(current_date)

        expect(next_pay_date.year).to eql(2016)
        expect(next_pay_date.month).to eql(1)
        expect(next_pay_date.day).to eql(15)
      end
    end

    context "when today is before the seecond paydate (30)" do

      let(:current_date) { DateTime.new(2015,11,25) }

      it "should return the next paydate as the 30th" do
        next_pay_date = described_class.calculate(current_date)

        expect(next_pay_date.year).to eql(2015)
        expect(next_pay_date.month).to eql(11)
        expect(next_pay_date.day).to eql(30)
      end

    end
  end

end