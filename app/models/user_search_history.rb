class UserSearchHistory < ApplicationRecord
  belongs_to :user
  validates :search_term, uniqueness:true, case_sensitive:false

  def is_true
    UserSearchHistory.where(success: true)
  end

end
