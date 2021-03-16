class SummariesController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @summary = Summary.new
    @summary.mistakes.new
  end

  def create
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

  def index
    teacher = Teacher.includes(:courses, :summaries).find(current_teacher.id)
    # Loading the summaries from the given course
    @summaries = teacher.summaries.order('created_at DESC')

  end

  private

  def summary_params
    # translate = translate()
    # words = params['words']['post'].split(',')
    # translate = {}
    # words.each do |word|
    #   translate[word] = {word: word}
    # end
    # new_word = Word.new(translate)
    # params.require(:summary).permit(:title, :overview, Word.new(translate), abyme_attributes)
    params.require(:summary).permit(:title, :overview, Word.new(translate), abyme_attributes)
  end

  # def translate
  #   words = params['words']['post'].split(',')
  #   client = Google::Cloud::Translate.translation_service
  #   response = client.translate_text(contents: words, mime_type:"text/plain",source_language_code:"en-US",target_language_code:"fr-FR", parent: "projects/silent-effect-307707")
  #   translate = {}
  #   words.each_with_index {|k,i| translate[k] = {word: k, translation: response.translations[i]["translated_text"]}}
  #   return translate
  # end

end
