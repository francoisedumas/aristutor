module API
  module V1
    class SummarysController < APIController
      # GET /api/summaries
      def index
        summaries = Summary.all
        # render json: summaries, include: [:summaries]
        render json: SummarySerializer.new(summaries).serializable_hash.to_json
        # SummarySerializer.new(summaries, options).serializable_hash.to_json
      end

      # GET /api/summaries/:id
      def show
        summarie = Summary.find(params[:id])
        render json: SummarySerializer.new(summarie).serializable_hash.to_json
      end
    end
  end
end
