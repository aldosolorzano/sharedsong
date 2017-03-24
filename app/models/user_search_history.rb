class UserSearchHistory < ApplicationRecord
  belongs_to :user
  validates :search_term, uniqueness:true, case_sensitive:false

end




def get_result
  self.result
end
