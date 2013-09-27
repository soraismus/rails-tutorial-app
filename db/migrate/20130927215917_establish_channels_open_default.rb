class EstablishChannelsOpenDefault < ActiveRecord::Migration
  def change
    remove_column :channels, :open, :boolean
    add_column :channels, :open, :boolean, :default => true
  end
end
