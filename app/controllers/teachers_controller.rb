class TeachersController < ApplicationController
  def show
    # @teacher = current_teacher
    @teacher = Teacher.includes(:courses, :summaries).find(current_teacher.id)
    # Getting the total number of summaries from this teacher
    @number_of_student = @teacher.courses.size
    # Sending the summary info
    all_summaries = @teacher.summaries
    number_of_summaries = all_summaries.size
    all_summaries_passed = all_summaries.select {|summary| summary.status == "passed"}
    # This enables to get number of summaries done
    # but investigate with a join query (to avoid N+1 query)
    total_summaries_done = all_summaries_passed.size
    @completion = number_of_summaries.zero? ? 0 : (total_summaries_done * 1.00 / number_of_summaries * 100).to_i
  end

  def edit
    @teacher = current_teacher
  end

  def update
    @teacher = current_teacher
    @teacher.update(teacher_params)
    redirect_to teacher_path(@teacher)
  end

    private

    def teacher_params
      params.require(:teacher).permit(:first_name, :last_name, :about, :photo)
    end
end
