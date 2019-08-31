class CreateActionItems < ActiveRecord::Migration[5.1]
  def change
    create_table :action_items do |t|
      t.integer :assigner_id
      t.integer :actionee_id
      t.string :action_item
      t.text :description
      t.datetime :deadline
      t.string :status

      t.timestamps
    end
  end
end
