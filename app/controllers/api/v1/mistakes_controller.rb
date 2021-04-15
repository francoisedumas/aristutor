module API
  module V1
    class MistakesController < APIController
      # GET /api/teachers
      def index
        mistakes = Mistake.all
        # render json: mistakes, include: [:courses]
        render json: MistakeSerializer.new(mistakes).serializable_hash.to_json
        # MistakeSerializer.new(mistakes, options).serializable_hash.to_json
      end

      # GET /api/mistakes/:id
      def show
        mistake = Mistake.find(params[:id])
        render json: MistakeSerializer.new(mistake).serializable_hash.to_json
      end
    end
  end
end
