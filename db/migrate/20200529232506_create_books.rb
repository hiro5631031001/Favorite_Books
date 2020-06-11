class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author
      t.text :explain
      t.string :url
      t.bigint :isbn
      t.string :image_url
      t.string :publisher_name
      t.timestamps
    end
  end
end
