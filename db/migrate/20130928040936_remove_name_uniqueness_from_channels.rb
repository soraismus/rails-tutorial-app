class RemoveNameUniquenessFromChannels < ActiveRecord::Migration
  def change
    remove_index :channels, :name
    add_index :channels, :name
  end
end
