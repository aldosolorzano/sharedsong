class UserShare < ApplicationRecord
  belongs_to :user
  belongs_to :share

  include AASM

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
end
