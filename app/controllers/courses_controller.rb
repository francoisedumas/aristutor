class CoursesController < ApplicationController
  def index
    if params[:query].present?
      @courses = Course.where("teacher_id = ?", current_teacher.id).search_by_first_and_last_name(params[:query])
      @students = @courses.map{|course| Student.find(course.student_id)}
    else
      @courses = Course.where("teacher_id = ?", current_teacher.id)
      @students = @courses.map{|course| Student.find(course.student_id)}
    end
  end

  def show
    # Sending object course
    @course = Course.includes(:summaries).find(params[:id])

    # Loading the summaries from the given course
    @summaries = @course.summaries.order('created_at DESC')

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

    # Sending the summary info
    @number_of_summary = @course.summaries.size
    all_summary_passed = @summaries.select {|summary| summary.status == "passed"}
    # This enables to get number of summaries done
    # but investigate with a join query (to avoid N+1 query)
    total_summary_done = all_summary_passed.size
    @completion = @number_of_summary.zero? ? 0 : (total_summary_done * 1.00 / @number_of_summary * 100).to_i
  end

  def new
    @course = Course.new
    @student = Student.new
  end

  def create
    @course = Course.new
    @student = Student.invite!(student_params)
    @course.student = @student
    @course.teacher = current_teacher
    if @course.save
      mail = StudentMailer.create_confirmation(@student)
      mail.deliver_now
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
    @student = @course.student
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :phone_number, :mother_language, :email, :photo)
  end
end
