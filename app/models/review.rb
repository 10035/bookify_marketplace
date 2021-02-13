class Review < ApplicationRecord
  validates :rating, inclusion: { in: [1,2,3,4,5], allow_nil: false }
  belongs_to :order
  belongs_to :user
end
