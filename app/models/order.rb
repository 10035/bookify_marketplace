class Order < ApplicationRecord
  belongs_to :book
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validate :no_orders_within_dates
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  private

  def no_orders_within_dates
    if end_date.blank? || start_date.blank?
      errors.add(:end_date, "please start start date and end date")
      return
    end
    book.orders.pluck(:start_date, :end_date).each do |date_array|
      dates = (date_array[0]..date_array[1])
      if dates.include?(start_date) || dates.include?(end_date)
        errors.add(:start_date, "This date is already taken.")
        puts "order dates overlap"
        return
      end
    end
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
