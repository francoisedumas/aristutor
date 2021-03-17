class Word < ApplicationRecord
  belongs_to :summary

  after_update :destroy_empty_word

  def destroy_empty_word
    destroy if translation == "" && word == ""
  end
end
