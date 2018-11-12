class Api::V1::TeachersController < Api::ApplicationController
  before_action :set_teachers, only: %i[index search]
  before_action :set_teacher, only: %i[show]

  private

  def set_teachers
    @teachers = TeachersRepository.all(params)
  end

  def set_teacher
    @teacher = TeachersRepository.find_by(params)
  end

end
