class Api::V1::CardsController < Api::ApplicationController
  before_action :permit_params
  before_action :set_lessons

  def index
    definition = params['definition']
    period = params['period']
    @cards = CardsRepository.get_by_lessons(@lessons, period, definition)
  end

  private

  def set_lessons
    @lessons = LessonsRepository.by_params(@permited_params.to_h)
  end

  def permit_params
    @permited_params = params.permit(allowed_params)
  end

  def allowed_params
    %i[
      teacher_id
      group_id
      definition
      period
    ]
  end
end
