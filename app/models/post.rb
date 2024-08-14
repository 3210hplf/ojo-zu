class Post < ApplicationRecord
  belongs_to :child
  has_many :comments, dependent: :destroy
  has_many :stamps, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { maximum: 10 }
  validates :created_date, presence: true
  validates :explanation, length: { maximum: 30 }
  validates :image, presence: true
  validates :child_id, presence: true
end
