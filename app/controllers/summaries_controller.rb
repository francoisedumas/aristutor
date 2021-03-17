class SummariesController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @summary = Summary.new
    @summary.mistakes.new
  end

  def create
    summary_params[:words_attributes] = build_words_params

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
    summary_params[:words_attributes] = build_words_params

    @summary = Summary.find(params[:id])
    @summary.update(summary_params)
    redirect_to summary_path(@summary)
  end

  def show
    @summary = Summary.find(params[:id])
  end

  def index
    teacher = Teacher.includes(:courses, :summaries).find(current_teacher.id)
    # Loading the summaries from the given course
    @summaries = teacher.summaries.order('created_at DESC')

  end

  private

  def summary_params
    params.require(:summary).permit(:title, :overview, abyme_attributes, words_attributes: [:word, :translation, :id])
  end

  def build_words_params
    return if params[:words] == ""

    new_key_value = params[:summary][:words_attributes] ? params[:summary][:words_attributes].keys.size : 0

    words_params = {}
    words = params[:words].split(',').map(&:strip)

    client   = Google::Cloud::Translate.translation_service
    response = client.translate_text(contents: words, mime_type:"text/plain",source_language_code:"en-US",target_language_code:"fr-FR", parent: "projects/silent-effect-307707")
    
    words.each_with_index do |word, index|
      words_params[(new_key_value + index).to_s] = { word: word, translation: response.translations[index]["translated_text"] }
    end


    if params[:summary][:words_attributes]
      params[:summary][:words_attributes].merge!(words_params)
    else
      params[:summary][:words_attributes] = words_params
    end

    return params[:summary][:words_attributes]
    # p params[:summary][:words_attributes]
  end
end
