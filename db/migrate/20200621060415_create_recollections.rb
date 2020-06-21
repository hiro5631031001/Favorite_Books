class CreateRecollections < ActiveRecord::Migration[5.2]
  def change
    create_table :recollections do |t|
      t.bigint     :book_id, foreign_key: true, null: false
      t.integer    :read_term,  null: false
      t.date       :readed_day, null: :false
      t.integer    :point,      null: false
      t.integer    :reread_timing, null: false
      t.text       :phrase
      t.text       :note
      t.timestamps
    end
  end
end
