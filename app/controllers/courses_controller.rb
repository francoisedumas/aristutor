class CoursesController < ApplicationController
  def index
    if params[:query].present?
      @courses = Course.where("teacher_id = ?", current_teacher.id).search_by_first_and_last_name(params[:query])
    else
      @courses = Course.where("teacher_id = ?", current_teacher.id)
    end
  end

  def show
    # Sending object course
    @course = Course.find(params[:id])

    # Sending the class language
    if @course.class_language == "EN"
      @class_language_name = "English"
    elsif @course.class_language == "FR"
      @class_language_name = "French"
    elsif @course.class_language == "SP"
      @class_language_name = "Spanish"
    elsif @course.class_language == "PT"
      @class_language_name = "Portuguese"
    end

    # Sending the summary
    @number_of_summary = @course.summaries.count
    # This enables to get number of summaries done
    # but investigate with a join query (to avoid N+1 query)
    total_summary_done = @course.done_summaries.size

    @completion = (total_summary_done * 1.00 / @number_of_summary * 100).to_i


    @summaries = @course.summaries
  end
  
  def new 
    @course = Course.new
  end
end
