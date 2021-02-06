# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



10.times {
  Author.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
    )
}

10.times {
  Book.create!(
    title: Faker::Book.title,
    published_year: [1920...2020].sample,
    genre: Faker::Book.genre,
    price: Faker::Number.decimal(l_digits: 2),
    description: Faker::Lorem.paragraphs,
    author_id: Author.all.map {|author| author.id}.sample
    )
}

2.times {
  User.create!(
    email: Faker::Internet.email,
    password: 12345678
    )
}
