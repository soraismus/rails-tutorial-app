class MakeChannelsNameUserIdPairingUnique < ActiveRecord::Migration
  def change
    add_index :channels, [:name, :user_id], unique: true
  end
end
