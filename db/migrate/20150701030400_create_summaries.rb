class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.posts :references

      t.timestamps null: false
    end
  end
end
