class CreateTeacherLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_languages do |t|
      t.string :language
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
