class AddOverviewToSummaries < ActiveRecord::Migration[6.0]
  def change
    add_column :summaries, :overview, :string
  end
end
