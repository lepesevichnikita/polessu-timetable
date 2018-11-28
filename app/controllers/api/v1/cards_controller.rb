class Api::V1::CardsController < Api::ApplicationController
  before_action :set_lessons

  def index
    definition = params['definition']
    period = params['period']
    @cards = CardsRepository.get_by_lessons(@lessons, period, definition)
  end

  private

  def set_lessons
    @lessons = LessonsRepository.by_params(params)
  end

end
