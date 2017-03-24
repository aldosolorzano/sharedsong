class User < ApplicationRecord
  has_secure_password
  has_many :user_search_histories, dependent: :destroy
  has_many :shares, dependent: :nullify
  # setting many to many relation btwn user & shares
  has_many :user_shares, dependent: :destroy
  has_many :shared_songs, through: :user_shares, source: :share

  has_friendship

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                  uniqueness:true,
                  format: VALID_EMAIL_REGEX

  def full_name
      "#{first_name} #{last_name}".strip.titleize
  end
end
