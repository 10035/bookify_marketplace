class Order < ApplicationRecord
  belongs_to :book
  has_one :review
  belongs_to :user
end
