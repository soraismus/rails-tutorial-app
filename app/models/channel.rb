class Channel < ActiveRecord::Base
  validates :name, :user_id, :presence => true
  validates :open, :presence => true
  belongs_to :user
end
