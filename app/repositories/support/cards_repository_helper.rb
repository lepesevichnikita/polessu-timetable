module CardsRepositoryHelper
  DEFS = {
    weeks: 20,
    days: 6
  }.freeze

  DAYS_PER_WEEK = 7

  STUDYING_DAY = 1
  STUDYING_MONTH = 9

  module_function

  def this_year
    Date.today.year
  end

  def studying_begin_date
    Date.new(this_year, STUDYING_MONTH, STUDYING_DAY)
  end

  # @param [Date, Datetime] - Date until
  # @return [Integer] - Weeks from studying begin
  #  until pased date
  def weeks_number_from_studying_begin_until_date(date)
    weeks_number_between_dates(studying_begin_date, date)
  end

  # @param [Integer] offset - offset for marker
  # @param [Symbol] defs - type of definitions
  # @param [String] marker - marker for number
  # @param [String] mask - mask for not number
  # @return [String] - number as string, that represent number
  #  as marker at defined position and other symbols are mask
  # @example
  #  number_as_string(3, :days)
  #  # 001000
  def number_as_string(offset, defs = :weeks, marker = '1', mask = '0')
    left_offset = DEFS[defs]
    offset -= 1 if defs == :weeks
    right_offset = offset.positive? ? offset : left_offset
    mask = marker unless offset.positive?
    marker.rjust(right_offset, mask).ljust(left_offset, mask)
  end

  # @param [Date, Datetime] start_date - Start date
  # @param [Date, Datetime] end_date - End date
  # @return [Integer] - Number of weeks between this dates
  def weeks_number_between_dates(start_date, end_date)
    start_date = round_to_pred_week(start_date)
    end_date = round_to_next_week(end_date)
    days_between = (end_date - start_date + 1).to_i
    days_between / DAYS_PER_WEEK
  end

  # @param [Date] date - Initial date
  # @return [Integer] days until next week
  def days_until_next_week(date)
    DAYS_PER_WEEK - date.cwday
  end

  # @param [Date] date - Date for rounding
  # @return [Date] Date rounded to next week
  def round_to_next_week(date)
    date + days_until_next_week(date).days
  end

  # @param [Date] date - Date for rounding
  # @return [Date] Date rounded to pred week
  def round_to_pred_week(date)
    date - date.cwday.days
  end

end
