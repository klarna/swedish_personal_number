require_relative 'spec_helper'

describe SwedishPersonalNumber do

  describe ".valid_format?" do
    it "should accept personal numbers with dashes" do
      personal_number = SwedishPersonalNumber.new("130101-0000")

      personal_number.valid_format?.must_equal true
    end
  end

  describe ".as_json" do
    it "should return the given personal number" do
      SwedishPersonalNumber.new("130101-0000").as_json.must_equal "130101-0000"
      SwedishPersonalNumber.new("1301010000").as_json.must_equal "1301010000"
    end
  end

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

  describe ".valid?" do
    it "should return true on valid date and format" do
      SwedishPersonalNumber.new("199901010000").valid?.must_equal true
      SwedishPersonalNumber.new("9901010000").valid?.must_equal true
    end

    it "should return false on invalid format" do
      SwedishPersonalNumber.new("19990101").valid?.must_equal false
    end

    it "should return false on invalid date" do
      SwedishPersonalNumber.new("201313130000").valid?.must_equal false
      SwedishPersonalNumber.new("1313130000").valid?.must_equal false
    end
  end

  describe ".of_underage_person?" do
    it "should return true when the birthdate is of an underage person" do
      SwedishPersonalNumber.new("1301010029").of_underage_person?.must_equal true
    end

    it "should return false when the birthdate is not of an underage person" do
      SwedishPersonalNumber.new("8501010029").of_underage_person?.must_equal false
    end
  end
end
