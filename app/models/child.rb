class Child < ApplicationRecord
  belongs_to :user

  mount_uploader :avatar_image, AvatarImageUploader

  validates :name, presence: true
  validates :birthday, presence: true
end
