class AddWordAndTranslationToWords < ActiveRecord::Migration[6.0]
  def change
    add_column :words, :word, :string
    add_column :words, :translation, :string
  end
end
