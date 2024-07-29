class Child < ApplicationRecord
  belongs_to :user
  has_many :posts

  mount_uploader :avatar_image, AvatarImageUploader

  validates :name, presence: true
  validates :birthday, presence: true
end
