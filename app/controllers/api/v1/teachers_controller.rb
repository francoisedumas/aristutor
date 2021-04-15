module API
  module V1
    class TeachersController < APIController
      # GET /api/teachers
      def index
        teachers = Teacher.all
        # render json: teachers, include: [:courses]
        render json: TeacherSerializer.new(teachers).serializable_hash.to_json
        # TeacherSerializer.new(teachers, options).serializable_hash.to_json
      end

      # GET /api/teachers/:id
      def show
        teacher = Teacher.find(params[:id])
        render json: TeacherSerializer.new(teacher).serializable_hash.to_json
      end

     
    end
  end
end
