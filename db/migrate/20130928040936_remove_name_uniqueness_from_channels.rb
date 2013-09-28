class RemoveNameUniquenessFromChannels < ActiveRecord::Migration
  def change
    remove_index :channels, :name, :unqiue => true
    add_index :channels, :name
  end
end
