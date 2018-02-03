class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.with_options foreign_key: true do
        references :user
        references :post
      end
      t.boolean :disactive, default: false

      t.timestamps
    end
  end
end
