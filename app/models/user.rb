class User < ApplicationRecord
  has_secure_password
  has_friendship

  has_many :user_search_histories, dependent: :destroy
  has_many :shares, dependent: :nullify
  # setting many to many relation btwn user & shares
  has_many :user_shares, dependent: :destroy
  has_many :shared_songs, through: :user_shares, source: :share

  has_many :likes, dependent: :destroy
  has_many :liked_shares, through: :likes, source: :share

  has_friendship

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                  uniqueness:true,
                  format: VALID_EMAIL_REGEX,
                  unless: :from_oauth?

  def full_name
      "#{first_name} #{last_name}".strip.titleize
  end


  def from_oauth?
    spotify_hash.present? && provider.present?
  end

  def self.create_from_spotify_oauth spotify_user, display_name
   User.create(
    first_name: display_name,
    email: spotify_user.email,
    provider: 'spotify',
    password: SecureRandom.hex(10)
    )
  end

end
