class Share < ApplicationRecord
  belongs_to :user
  belongs_to :song

  has_many :user_shares, dependent: :destroy
  has_many :shared_users, through: :user_shares, source: :user


  validates :title, presence:true
  validates :artist, presence:true

  
end
