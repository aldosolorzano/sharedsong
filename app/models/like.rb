class Like < ApplicationRecord
  belongs_to :share
  belongs_to :user

  validates :share_id, uniqueness: { score: :user_id }

end
