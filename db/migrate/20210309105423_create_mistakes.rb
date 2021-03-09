class CreateMistakes < ActiveRecord::Migration[6.0]
  def change
    create_table :mistakes do |t|
      t.string :wrong_content
      t.string :correct_content
      t.string :status, default: "created"
      t.references :summary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
