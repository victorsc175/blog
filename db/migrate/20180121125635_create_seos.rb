class CreateSeos < ActiveRecord::Migration[5.1]
  def change
    create_table :seos do |t|
      t.string :title
      t.string :keywords
      t.string :description
      t.references :seoable, polymorphic: true

      t.timestamps
    end
  end
end
