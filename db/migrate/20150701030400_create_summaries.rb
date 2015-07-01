class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.references :post
      t.timestamps null: false
    end
  end
end
