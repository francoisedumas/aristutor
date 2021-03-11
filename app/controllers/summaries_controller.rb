class SummariesController < ApplicationController
  def create
    course = Course.find(params[:course_id])
    @summary = Summary.new(course: course)
    # Need to provide the current user in order to add an owner
    # @summary.teacher = current_user
    if @summary.save
      redirect_to edit_course_summary_path(course_id: @summary.course_id, id: @summary.id)
    else
      redirect_to course_path(course)
    end
  end

  def edit
    @summary = Summary.find(params[:id])
  end

  def update
    @summary = Summary.find(params[:id])
    @summary.update(summary_params)
    redirect_to summary_path(@summary)
  end

  def show
    
  end

  private

  def summary_params
    params.require(:summary).permit(:title, :overview)
  end
end
