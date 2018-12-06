require 'support/cards_repository_helper'

# Repository for getting cards
class CardsRepository < MongoidDocumentRepository::Base
  extend CardsRepositoryHelper

  # Returns cards by lessons at period of definition
  # @param [Array, Mongoid::Criteria] lessons Lessons of cards
  # @param [Symbol, String] period Phase of definition
  # @param [Symbol, String] definition Definition for period
  # @return [Mongoid::Criteria] Result of search
  def self.get_by_lessons(lessons, period = :today, definition = :day)
    res = send("by_#{definition}", period)
          .where(:lessonid.in => lessons.pluck(:id))
    res
  end

  # Returns cards by day
  #  :today or :tomorrow
  # @param [Symbol, String] day Day of cards
  # @return [Mongoid::Criteria] Result of search
  def self.by_day(day = nil)
    by_date(Date.send(day))
  end

  # Returns cards by week
  # @param [Symbol, String] week Week of cards
  # @return [Mongoid::Criteria] Result of search
  def self.by_week(week = nil)
    week = week.to_sym
    weeks_number = weeks_number_from_studying_begin_until_date(Date.today)
    weeks_number += 1 if week == :next
    weeks_as_string = number_as_string(weeks_number)
    model.where(weeks: weeks_as_string)
        .desc(:days)
        .asc(:period)
  end

  # Returns cards by date
  # @param [Date] date Date of cards
  # @return [Mongoid::Criteria] Result of search
  def self.by_date(date)
    weeks_number = weeks_number_from_studying_begin_until_date(date)
    days_as_string = number_as_string(date.cwday, :days)
    weeks_as_string = number_as_string(weeks_number)
    Card.where(days: days_as_string, weeks: weeks_as_string)
        .desc(:days)
        .asc(:period)
  end
end
