class FlashcardsController < ApplicationController
  def show
    # Selecting the summary from where we create the flashcards
    # Do an eager loading of all words and mistake on the current summary
    @summary = Summary.includes(:words, :mistakes).find(params[:summary_id])

    # Extraction of size, words and mistakes
    total_words             = @summary.words.size
    total_mistakes          = @summary.mistakes.size
    all_words_not_passed    = @summary.words.select {|word| word.status != "passed"}
    all_mistakes_not_passed = @summary.mistakes.select {|mistake| mistake.status != "passed"}

    # Creation of a global array with object Word and Mistakes not passed
    if all_mistakes_not_passed.size == 2
      all_flashcards_not_passed = [all_mistakes_not_passed.first, all_words_not_passed, all_mistakes_not_passed.last].flatten
    else
      if all_words_not_passed.size == 3
        all_flashcards_not_passed = [all_words_not_passed[1], all_words_not_passed[2], all_words_not_passed[0], all_mistakes_not_passed].flatten
      elsif all_words_not_passed.size == 2
        all_flashcards_not_passed = [all_words_not_passed[1], all_words_not_passed[0], all_mistakes_not_passed].flatten
      else
        all_flashcards_not_passed = [all_words_not_passed, all_mistakes_not_passed].flatten
      end
    end

    # raise
    # Calculation
    @number_total = total_words + total_mistakes
    number_total_not_passed = all_words_not_passed.size + all_mistakes_not_passed.size
    @number_total_passed = @number_total - number_total_not_passed
    @completion = (@number_total_passed * 1.00 / @number_total * 100).to_i

    if @number_total_passed < @number_total

      # From the global array sample a word or a mistake
      @flashcard = all_flashcards_not_passed.first
    else
      @summary.update(status: 'passed')
      redirect_to success_summary_flashcards_path
    end
  end

  def passed
    # From the view we got the class as a string in the params
    # Turns it into constante and then chains ActiveRecord methods
    # see it in action using rails c and 'Word'.constantize => give a "class" Word
    # 'application_record'.camelize.constantize =>  give a "class" ApplicationRecord
    klass = params['summary_id'].split('/').last.camelize.constantize
    id = params['summary_id'].split('/')[-2]
    # if a student press passed button the status is updated
    klass.find(id).update(status: 'passed') # exp Word.find(9)

    # student is redirected to the show of flashcard and get next one
    redirect_to summary_flashcards_path
  end

  def failed
    klass = params['summary_id'].split('/').last.camelize.constantize
    id = params['summary_id'].split('/')[-2]
    klass.find(id).update(status: 'failed')
    # if a student press failed button we redirect to the show of flashcard
    # passing the params class (Word or Mistake) of the failed flashcard
    redirect_to summary_flashcards_path
  end

  def success
    id = params['summary_id'].split('/')[0]
    @summary = Summary.find(id)
  end
end
