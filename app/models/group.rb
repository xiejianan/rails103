class Group < ApplicationRecord
  belongs_to :user
  belongs_to :posts
  validates :title,presence:true
end
