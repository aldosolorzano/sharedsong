class Song < ApplicationRecord
  has_many :shares, dependent: :nullify                                                   
end
