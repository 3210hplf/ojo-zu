class Invitation < ApplicationRecord
  belongs_to :user
  #efore_create :generate_token

  validates :token, uniqueness: true

  def generate_token
    self.token = SecureRandom.hex(10)
  end

  def expired?
    Time.current > expires_at
  end
end
