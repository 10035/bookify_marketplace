class Author < ApplicationRecord
  has_many :books
  has_one_attached :photo

  # TBC IF MODULE REQUIRED HERE
  include PgSearch::Model
  multisearchable against: :books
end
