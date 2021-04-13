class SummariesController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @summary = Summary.new
    @summary.mistakes.new
  end

  def create
    # raise
    summary_params[:words_attributes] = build_words_params # words_attributes: [:word, :translation, :id] define below
    # exp {"0"=>{"word"=>"car", "translation"=>"voiture", "id"=>"70"}, "1"=>{"word"=>"boat", "translation"=>"bateau", "id"=>"71"}}

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

  def send_flashcards
    summary = Summary.find(params[:id])
    student = summary.course.student
    mail = StudentMailer.sending_summary(student, summary)
    mail.deliver_now
    summary.update(status: "sent")
    redirect_to course_path(summary.course), notice: "Summary sent"
  end

  private

  def summary_params
    params.require(:summary).permit(:title, :overview, abyme_attributes, words_attributes: %i[word translation id])
  end

  def build_words_params
    # check if a word has been entered
    return if params[:words] == ""

    # get the number of words already existing and translated in the summary
    # this is helpful to update the db starting at the proper each_with_index
    new_key_value = params[:summary][:words_attributes] ? params[:summary][:words_attributes].keys.size : 0

    # prepare our hash
    words_params = {}
    # split the words string into individual words and cleaning words
    words = params[:words].split(',').map(&:strip)

    # Connect with Google
    client   = Google::Cloud::Translate.translation_service

    # Pass the words to translate
    response = client.translate_text(contents: words, mime_type: "text/plain", source_language_code: "en-US",
                                     target_language_code: "fr-FR", parent: "projects/translation-aristutor")

    # creating key-value pairs for the hash
    words.each_with_index do |word, index|
      words_params[(new_key_value + index).to_s] =
        { word: word, translation: response.translations[index]["translated_text"] }
    end
    # exp {"0"=>{:word=>"boat", :translation=>"bateau"}, "1"=>{:word=>"truck", :translation=>"un camion"}}

    if params[:summary][:words_attributes] # if update summaries which already get words
      params[:summary][:words_attributes].merge!(words_params) # merge the existings and new
    else
      params[:summary][:words_attributes] = words_params # no pre-existing words just save
    end

    return params[:summary][:words_attributes]
  end
end
