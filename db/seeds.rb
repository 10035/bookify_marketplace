# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Deleting seed"

Author.destroy_all
Book.destroy_all
User.destroy_all

puts "Seeding starting..."

10.times {
  Author.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
    )
}

10.times {
  file = URI.open('https://picsum.photos/300/300')

  book = Book.new(
    title: Faker::Book.title,
    published_year: rand(1900..2020),
    genre: Faker::Book.genre,
    price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    description: Faker::Lorem.paragraphs,
    author_id: Author.all.map {|author| author.id}.sample
    )
  book.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  book.save
}

2.times {
  User.create!(
    email: Faker::Internet.email,
    password: 12345678
    )
}


puts Author.count
puts Book.count
puts User.count

puts "Seeding complete"
