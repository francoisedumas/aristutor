class SummariesController < ApplicationController
  def create
    @summary = Summary.new()
    course = Course.find(params[:course_id])
    @summary.course = course

    if @summary.save
      redirect_to edit_summary_path(@summary)
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
    @summary = Summary.find(params[:id])
  end

  private

  def summary_params
    params.require(:summary).permit(:title, :overview)
  end
end
