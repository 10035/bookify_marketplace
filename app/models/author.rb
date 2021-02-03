class Author < ApplicationRecord
  has_many :books

  AUTHORS = [];

  Author.all.each { |author| AUTHORS << author }
end



# Author.all.each { |author| AUTHORS << author.first_name.capitalize + " " +  author.last_name.capitalize }
