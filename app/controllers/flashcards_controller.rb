class FlashcardsController < ApplicationController
  def show
    # Selecting the summary from where we create the flashcards
    @summary = Summary.find(params[:summary_id])

    # In order to generate randomly flashcards from both words and mistakes tables
    # a sample between the Class Word and Mistake is done
    flashcard_class = [Word, Mistake].sample

    total_words = Word.where(summary: @summary).count
    total_mistakes = Mistake.where(summary: @summary).count
    total_words_passed = Word.where(summary: @summary).where(status: "passed").count
    total_mistakes_passed = Mistake.where(summary: @summary).where(status: "passed").count

    @number_total = total_words + total_mistakes
    @number_total_passed = total_words_passed + total_mistakes_passed

    @completion = (@number_total_passed * 1.00 / @number_total * 100).to_i

    if @number_total_passed < @number_total
      # Supposing the class randomely selected is Word the first line is
      # Word.where.not(status: "passed") select only word not passed from table words
      # .where(summary: @summary) selecting only word with foreign key of our summary
      # .order('RANDOM()').first then shuffle all those words not passed and select the first one
      @flashcard = flashcard_class.where.not(status: "passed")
                                  .where(summary: @summary).order('RANDOM()').first

      # if @flashcard is empty meaning that all the line from word of this summary are passed
      # we check for the other class Mistake if anything remains to be passed

      unless @flashcard
        flashcard_class = ([Word, Mistake] - [flashcard_class]).first
        @flashcard = flashcard_class.where.not(status: "passed")
                                    .where(summary: @summary).order('RANDOM()').first
      end
    else
      redirect_to success_summary_flashcards_path
    end
  end

  def passed
    # generation of the class Word or Mistake
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
  end

end
