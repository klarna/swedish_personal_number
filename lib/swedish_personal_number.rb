require "swedish_personal_number/version"
require "active_support/core_ext"

class SwedishPersonalNumber

  attr_accessor :personal_number, :birth_date
  def initialize(personal_number)
    @raw_personal_number = personal_number
    @personal_number = personal_number.tr("-", "")
    @birth_date = valid_format? ? DateParser.new(personal_number[0..-5]).to_date : nil
  end

  def valid_format?
    !personal_number.nil? && !personal_number.match(/\A\d{10,12}\z/).nil?
  end

  def valid?
    !!birth_date
  end

  def of_underage_person?
    birth_date > 18.years.ago
  end

  def as_json
    @raw_personal_number
  end

  private

  class DateParser

    attr_accessor :year, :month, :day
    def initialize(date)
      @year, @month, @day = date.match(/(\d{2,4})(\d{2})(\d{2})/).captures
    end

    def to_date
      Date.new(fixed_year.to_i, month.to_i, day.to_i) rescue nil
    end

    private

    def fixed_year
      year.length == 4 ? year : "#{century}#{year}"
    end

    def century
      this_year >= year ? '20' : '19'
    end

    def this_year
      Time.now.strftime('%y')
    end
  end

end
