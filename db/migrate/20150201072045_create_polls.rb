class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.references :created_by, null: false
      t.text :question, null: false
      t.timestamps
    end
    add_foreign_key :polls, :users, column: :created_by_id
  end
end
