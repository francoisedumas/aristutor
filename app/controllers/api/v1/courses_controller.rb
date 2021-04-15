module API
  module V1
    class CoursesController < APIController
      # GET /api/courses
      def index
        courses = Course.all
        # render json: courses, include: [:courses]
        render json: CourseSerializer.new(courses).serializable_hash.to_json
        # CourseSerializer.new(courses, options).serializable_hash.to_json
      end

      # GET /api/courses/:id
      def show
        course = Course.find(params[:id])
        render json: CourseSerializer.new(course).serializable_hash.to_json
      end
    end
  end
end
