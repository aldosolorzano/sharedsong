class SearchCache < ApplicationRecord
  validates :search_term, uniqueness:true, case_sensitive:false
end
