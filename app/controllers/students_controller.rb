class StudentsController < ApplicationController

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to courses_path
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :phone_number, :mother_language, :email, :photo)
  end

end
