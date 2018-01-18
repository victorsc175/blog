class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, index: { unique: true }
      t.text :body
      t.references :user, foreign_key: true
      t.boolean :disactive, default: false

      t.timestamps
    end
  end
end
