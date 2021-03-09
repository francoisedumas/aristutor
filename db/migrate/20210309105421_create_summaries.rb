class CreateSummaries < ActiveRecord::Migration[6.0]
  def change
    create_table :summaries do |t|
      t.string :title
      t.boolean :sent, default: false
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
