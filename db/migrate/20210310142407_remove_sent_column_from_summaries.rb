class RemoveSentColumnFromSummaries < ActiveRecord::Migration[6.0]
  def change
    remove_column :summaries, :sent
  end
end
