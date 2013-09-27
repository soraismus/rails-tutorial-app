class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.integer :user_id
      t.boolean :open

      t.timestamps
    end
  end
end
