class RemoveRereadTimingFromRecollections < ActiveRecord::Migration[5.2]
  def up
    remove_column :recollections, :reread_timing, :integer
  end

  def down
    add_column :recollections, :reread_timing, :integer
  end
end
