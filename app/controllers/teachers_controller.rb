class TeachersController < ApplicationController
  def show
    @teacher = current_teacher
  end

  def edit
    @teacher = current_teacher
  end

  def update
    @teacher = Teacher.find(params[:id])
    @teacher.update(teacher_params)
    redirect_to teacher_path(@teacher)
  end

    private
    
    def teacher_params
      params.require(:teacher).permit(:first_name, :last_name, :about, :photo)
    end
end
