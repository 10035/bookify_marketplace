class Author < ApplicationRecord
  has_many :books

  AUTHORS = [];

  Author.all.each { |author| AUTHORS << author }
end
