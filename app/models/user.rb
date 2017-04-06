class User < ApplicationRecord

  serialize :spotify_hash, Hash
  searchkick word_middle: [:first_name,:last_name]

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

  def search_for_users search_term
    users = User.search(search_term)
    users.to_a.map(&:full_name)
  end
  def search_data
    {
      first_name: first_name,
      last_name: last_name
    }
  end

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
    spotify_hash: spotify_user.to_hash,
    provider: 'spotify',
    password: SecureRandom.hex(10)
    )
  end

  def create_array_of_pending_shares
      pending_shares = []
      self.user_shares.each do |us|
        if us.created?
          s = us.share
          user_creator = User.find(s.user_id)
          pending_shares.push({
            share_id: s.id,
            user_creator: user_creator.first_name,
            song_title: s.title,
            artist: s.artist
          })
        end
      end
      pending_shares
  end
  def create_array_of_accepted_shares
      accepted_shares = []
      self.user_shares.each do |us|
        if us.accepted?
          accepted_shares.push(us.share)
        end
      end
      accepted_shares
  end
  end
