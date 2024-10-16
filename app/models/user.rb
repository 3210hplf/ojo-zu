class User < ApplicationRecord
  authenticates_with_sorcery!

  has_one :profile, dependent: :destroy
  has_many :children, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :stamps, dependent: :destroy
  has_many :stamp_posts, through: :stamps, source: :post
  has_many :invitations, dependent: :destroy

  # パスワードは8文字以上
  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  # メアドは入力必須で、一意のものとする
  validates :email, presence: true, uniqueness: true

  # 投稿者：１、　閲覧者：２
  enum role: { poster: 1, viewer: 2 }

  def own?(object)
    id == object&.user_id
  end

  def unstamped(stamp)
    stamps.destroy(stamp)
  end
end
