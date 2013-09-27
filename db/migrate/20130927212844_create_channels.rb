class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.integer :user_id
      t.boolean :open

      t.timestamps
    end
    add_index :channels, :name, unique: true
    add_index :channels, :user_id
  end
end
