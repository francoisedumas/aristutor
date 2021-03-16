class SummariesController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @summary = Summary.new
    @summary.mistakes.new
  end
  
  def create
    params[:summary][:words_attributes] = build_words_params
    @summary = Summary.new(summary_params)

    course = Course.find(params[:course_id])
    @summary.course = course

    if @summary.save
      redirect_to summary_path(@summary.id)
    else
      render :new
    end
  end

  def edit
    @summary = Summary.find(params[:id])
  end

  def update
    @summary = Summary.find(params[:id])
    @summary.update(summary_params)
    redirect_to summary_path(@summary)
  end

  def show
    @summary = Summary.find(params[:id])
  end

  private

  def summary_params
    params.require(:summary).permit(:title, :overview, mistakes_attributes: [:wonrg_content, :correct_conten], words_attributes: [:word, :translation])
  end

  def build_words_params
    words_params = {}
    words = params[:words].split(',').map(&:strip)

    client   = Google::Cloud::Translate.translation_service
    response = client.translate_text(contents: words, mime_type:"text/plain",source_language_code:"en-US",target_language_code:"fr-FR", parent: "projects/silent-effect-307707")
    
    words.each_with_index do |word, index|
      words_params[index.to_s] = { word: word, translation: response.translations[index]["translated_text"] }
    end

    return words_params
  end

end
