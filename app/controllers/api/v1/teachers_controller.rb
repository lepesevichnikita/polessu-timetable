class Api::V1::TeachersController < Api::ApplicationController
  before_action :set_teachers, only: %i[index search]
  before_action :set_teacher, only: %i[show]

  private

  def set_teachers
    @teachers = Teacher.all
    @teachers = @teachers.full_text_search(params[:query]) if params[:query]
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

end
