class Share < ApplicationRecord
  belongs_to :user
  belongs_to :song

  has_many :user_shares, dependent: :nullify
  has_many :shared_users, through: :user_shares, source: :user

  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user


  validates :title, presence:true
  validates :artist, presence:true

  def liked_by(user)
    likes.exists?(user: user)
  end

  def liked_for(user)
    likes.find_by(user: user)
  end

end
