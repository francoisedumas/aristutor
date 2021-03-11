class FlashcardsController < ApplicationController
  before_action :set_flashcard, only: [:passed]
  def show
    # Pseudo code
    # We have a summary as we are nested below the summary
    # need to chose which flashcard to show
    # we randomly choose among words and mistakes
    # should not be a passed one
    # not the one we just did
    @summary = Summary.find(params[:summary_id]) # I am on it I want to get the summary I am working on
    flashcard_class = [Word, Mistake].sample
    @flashcard = flashcard_class.where.not(status: "passed")
                                .where(summary: @summary).order('RANDOM()').first

    unless @flashcard
      flashcard_class = ([Word, Mistake] - [flashcard_class]).first
      @flashcard = flashcard_class.where.not(status: "passed")
                                  .where(summary: @summary).order('RANDOM()').first
    end

    @number_total # 2 queries to words and mistakes to get total number
    @number_of_completed # 2 queries to words and mistakes not passed
    # Word.where(status: "passed").count
  end

  def passed
    @flashcard.update(status: 'passed')

    redirect_to flashcard_path
  end

  def failed
    redirect_to flashcard_path(
      previous_flashcard_class: params[:flashcard_class],
      previous_flashcard_id:    params[:flashcard_id]
    )
  end

  private

  def set_flashcard
    klass = params[:flashcard_class].camelize.constantize
    id    = params[:flashcard_id]

    @flashcard = klass.find(id)
  end
end
