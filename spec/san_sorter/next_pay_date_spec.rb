require 'spec_helper'

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
