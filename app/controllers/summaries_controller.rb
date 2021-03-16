class SummariesController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @summary = Summary.new
    @summary.mistakes.new
  end
  
  def create
    @summary = Summary.new(summary_params)

    course = Course.find(params[:course_id])
    @summary.course = course

    if @summary.save
      redirect_to summary_path(@summary.id)
    else
      render :new
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
    params.require(:summary).permit(:title, :overview, abyme_attributes)
  end

end
