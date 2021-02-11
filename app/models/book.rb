class Book < ApplicationRecord
  
  belongs_to :author
  has_many :orders
  has_many :reviews, through: :orders
  has_many_attached :photos
  
  # include PgSearch::Model
  # multisearchable against: title:
  
  # THIS MODULE ENABLES PG_SEARCH GEM TO DO ITS WORK TO SEARCH THROUGH ASSOCIATION


  def unavailable_dates
    orders.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
  
  # include PgSearch::Model
  # pg_search_scope :global_search,
  #   against: [ :title, :description ], 
  #   associated_against: {
  #     author: [ :first_name, :last_name ]
  #   }, 
  #   using: {
  #     tsearch: { prefix: true }
  #   }
end
