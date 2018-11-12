module CardsRepositoryHelper
  DEFS = {
    weeks: 20,
    days: 6
  }.freeze

  STUDYING_DAY = 1
  STUDYING_MONTH = 9

  module_function

  def this_year
    Date.today.year
  end

  def studying_begin_date
    Date.new(this_year, STUDYING_MONTH, STUDYING_DAY)
  end

  def weeks_number_from_studying_begin_until_date(date)
    weeks_number_between_dates(studying_begin_date, date)
  end

  def number_as_string(offset, defs = :weeks)
    left_just_offset = DEFS[defs]
    right_just_offset = offset - 1
    res = '1'.rjust(right_just_offset, '0').ljust(left_just_offset, '0')
    res
  end

  def weeks_number_between_dates(start_date, end_date)
    start_date = round_to_prew_week(start_date)
    end_date = round_to_next_week(end_date)
    days_between = (end_date - start_date).to_i
    days_between/DEFS[:days]
  end

  def days_until_next_week(date)
    DEFS[:days] - date.cwday
  end

  def round_to_next_week(date)
    date + days_until_next_week(date).days
  end

  def round_to_prew_week(date)
    date - date.cwday.days
  end

end