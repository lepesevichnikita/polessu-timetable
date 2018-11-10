class CardsRepository
  DEFS = {
    weeks: 20,
    days: 6
  }

  STUDYING_DAY = 1
  STUDYING_MONTH = 9

  def self.by_day(day)
    by_date(Date.send(day))
  end
  
  def self.by_week(week=nil)
    weeks_number = weeks_number_from_studying_begin_until_date(Date.today)
    weeks_number += 1 if week == :next
    weeks_as_string = number_as_string(weeks_number)
    Card.where(weeks: weeks_as_string).desc(:days)
  end

  def self.by_date(date)
    weeks_number = weeks_number_from_studying_begin_until_date(date)
    days_as_string = number_as_string(date.cwday, :days)
    weeks_as_string = number_as_string(weeks_number)
    Card.where(days: days_as_string, weeks: weeks_as_string).desc(:days)
  end

  def self.this_year
    Date.today.year
  end

  def self.studying_date
    Date.new(this_year, STUDYING_MONTH, STUDYING_DAY)
  end

  def self.weeks_number_from_studying_begin_until_date(date)
    start_date = studying_date
    end_date = Date.today
    weeks_number = weeks_number_between_dates(start_date, end_date)
  end

  private

  def self.number_as_string(offset, defs = :weeks)
    res = '0' * (offset - 1)
    res += '1'
    res += '0' * (DEFS[defs] - offset)
    res
  end

  def self.weeks_number_between_dates(start_date, end_date)
    start_date = round_to_prew_week(start_date)
    end_date = round_to_next_week(end_date)
    days_between = (end_date - start_date).to_i
    days_between/DEFS[:days]
  end

  def self.days_until_next_week(date)
    DEFS[:days] - date.cwday
  end

  def self.round_to_next_week(date)
    date + days_until_next_week(date).days
  end

  def self.round_to_prew_week(date)
    date - date.cwday.days
  end

end
