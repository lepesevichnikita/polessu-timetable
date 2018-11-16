require 'support/cards_repository_helper'

class CardsRepository
  extend CardsRepositoryHelper

  def self.by_period_for(model, model_id, period, part)
    model_in ="#{model}.in".to_sym
    send("by_#{period}", part).where(model_in => model_id)
  end

  def self.by_day(day=nil)
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
end
