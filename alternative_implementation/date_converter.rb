require 'date'

module DateConverter
  def to_date
    Date.new(year.to_i, month.to_i, day.to_i)
  end
end

module IntConverter
  def to_i
    text_value.to_i
  end
end

module ShortYear
  def to_i
    "#{century}#{text_value}".to_i
  end

  def century
    text_value > Date.today.strftime('%y') ? "19" : "20"
  end
end

module PersonalNumber
  def date
    date_part.to_date
  end
end
