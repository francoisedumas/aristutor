class CoursesController < ApplicationController
  def index
    if params[:query].present?
      @courses = Course.where("teacher_id = ?", current_teacher.id).search_by_first_and_last_name(params[:query])
    else
      @courses = Course.where("teacher_id = ?", current_teacher.id)
    end
  end
end
