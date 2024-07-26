class Profile < ApplicationRecord
  belongs_to :user

  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true
  validates :relationship, presence: true

  enum relationship: { mother: 1, father: 2, grand_mother: 3, grand_father: 4, aunt: 5, uncle: 6, other: 7 }
end
