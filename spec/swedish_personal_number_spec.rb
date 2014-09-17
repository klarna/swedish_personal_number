require_relative 'spec_helper'

describe SwedishPersonalNumber do
  describe ".birth_date" do

    it "should return valid date on valid 10 digit personal number in this century" do
      birth_date = SwedishPersonalNumber.new("1301010029").birth_date

      birth_date.must_equal Date.new(2013, 1, 1)
    end

    it "should return valid date on valid 12 digit personal number in this century" do
      birth_date = SwedishPersonalNumber.new("201301010029").birth_date

      birth_date.must_equal Date.new(2013, 1, 1)
    end

    it "should return valid date on valid 10 digit personal number in last century" do
      birth_date = SwedishPersonalNumber.new("3101010029").birth_date

      birth_date.must_equal Date.new(1931, 1, 1)
    end

    it "should return valid date on valid 12 digit personal number in last century" do
      birth_date = SwedishPersonalNumber.new("193101010029").birth_date

      birth_date.must_equal Date.new(1931, 1, 1)
    end

    it "should return nil on empty personal number" do
      birth_date = SwedishPersonalNumber.new("").birth_date

      birth_date.must_be_nil
    end

    it "should return nil on inavlid date in the personal number" do
      birth_date = SwedishPersonalNumber.new("199913130029").birth_date

      birth_date.must_be_nil
    end

  end
end
