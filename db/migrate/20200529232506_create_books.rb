class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string  :title, null: false
      t.string  :author, null: false
      t.string  :publisher, null: false
      t.integer :category, null: false
      t.integer :status, null: false, default: 0
      t.string  :image
      t.date    :buy_date, null: false
      t.timestamps
    end
  end
end
