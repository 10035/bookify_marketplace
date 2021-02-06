class Book < ApplicationRecord
  belongs_to :author
  has_many :orders
  has_many :reviews, through: :orders
  has_one_attached :photo

  # def unavailable_dates
  #   orders.pluck(:start_date, :end_date).map do |range|
  #     { from: range[0], to: range[1] }
  #   end
  # end
end
