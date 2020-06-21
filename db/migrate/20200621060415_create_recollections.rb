class CreateRecollections < ActiveRecord::Migration[5.2]
  def change
    create_table :recollections do |t|

      t.timestamps
    end
  end
end
