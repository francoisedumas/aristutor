module API
  module V1
    class StudentsController < APIController
      # GET /api/students
      def index
        students = Student.all
        # render json: students, include: [:students]
        render json: StudentSerializer.new(students).serializable_hash.to_json
        # StudentSerializer.new(students, options).serializable_hash.to_json
      end

      # GET /api/students/:id
      def show
        student = Student.find(params[:id])
        render json: StudentSerializer.new(student).serializable_hash.to_json
      end
    end
  end
end
