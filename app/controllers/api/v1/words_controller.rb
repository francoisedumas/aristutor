module API
  module V1
    class WordsController < APIController
      # GET /api/words
      def index
        words = Word.all
        # render json: words, include: [:words]
        render json: WordSerializer.new(words).serializable_hash.to_json
        # WordSerializer.new(words, options).serializable_hash.to_json
      end

      # GET /api/words/:id
      def show
        word = Word.find(params[:id])
        render json: WordSerializer.new(word).serializable_hash.to_json
      end
    end
  end
end
