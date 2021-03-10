class AddStatusColumnToSummaries < ActiveRecord::Migration[6.0]
  def change
    add_column :summaries, :status, :string, default: "created"
  end
end
