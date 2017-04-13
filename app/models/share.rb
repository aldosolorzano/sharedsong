class Share < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :song

  has_many :user_shares, dependent: :nullify
  has_many :shared_users, through: :user_shares, source: :user

  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user


  validates :title, presence:true
  validates :artist, presence:true

  aasm whiny_transitions: false do
    state :created, intial: true
    state :accepted
    state :rejected

    event :accept do
      transitions from: :created, to: :accepted
    end

    event :reject do
      transitions from: :created, to: :rejected
    end
  end

  def liked_by(user)
    likes.exists?(user: user)
  end

  def liked_for(user)
    likes.find_by(user: user)
  end

  def shared_to(user)
    user_shares.find_by(user:user)
  end
end
