class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.references :poll, index: true, null: false
      t.string :text, null: false
      t.timestamps
    end
    add_foreign_key :choices, :polls
  end
end
