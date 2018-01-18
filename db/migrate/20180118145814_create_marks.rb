class CreateMarks < ActiveRecord::Migration[5.1]
  def change
    create_table :marks do |t|
      t.integer :value
      t.with_options foreign_key: true do
        references :user
        references :post
      end
      t.boolean :disactive, default: false

      t.timestamps
    end
    add_index :marks, [:user_id, :post_id], unique: true
  end
end
