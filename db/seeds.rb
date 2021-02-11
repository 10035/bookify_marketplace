# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Author.all.map {|author| author.id}.sample


require "open-uri"

authors = ["https://images.unsplash.com/photo-1594616838951-c155f8d978a0?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mzl8fGF2YXRhcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60", "https://images.unsplash.com/photo-1586297135537-94bc9ba060aa?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mjl8fGF2YXRhcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60", "https://images.unsplash.com/photo-1558898479-33c0057a5d12?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjZ8fGF2YXRhcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60", "https://images.unsplash.com/photo-1528763380143-65b3ac89a3ff?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjR8fGF2YXRhcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60", "https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Nnx8YXZhdGFyfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60", "https://images.unsplash.com/photo-1607746882042-944635dfe10e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8YXZhdGFyfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60", "https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8YXZhdGFyfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60", "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8YXZhdGFyfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1296&q=60", "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8YXZhdGFyfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1296&q=60", "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8YXZhdGFyfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1296&q=60"]


puts "Deleting seed"

Review.delete_all
Order.delete_all
Book.destroy_all
Author.destroy_all
User.destroy_all

puts "Seeding starting..."
puts "Creating authors..."
10.times do |idx|
  author = authors[idx]
  file = URI.open(author)

  author = Author.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
    )
  author.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  author.save!
end
puts "#{Author.count} authors created"

puts "Creating books..."
10.times do |num|
  file = URI.open('https://picsum.photos/300/300')

  book = Book.new(
    title: Faker::Book.title,
    published_year: rand(1900..2020),
    genre: Faker::Book.genre,
    price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    description: [Faker::Quote.matz, Faker::Quote.most_interesting_man_in_the_world ].sample,
    author_id: Author.all.sample.id
    )
  book.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  book.save!
end
puts "#{Book.count} Users created"


puts "Creating users..."
4.times {
  User.create!(
    email: Faker::Internet.email,
    password: 12345678
    )
}
puts "#{User.count} Users created"

puts "Creating orders..."
10.times {
  Order.create!(
    start_date: Faker::Date.backward(days: 14),
    end_date: Faker::Date.forward(days: 14),
    book_id: Book.all.sample.id,
    user_id: User.all.sample.id
    )
}
puts "#{Order.count} Orders created"

puts "Creating reviews..."
10.times {
  order = Order.all.sample
  user_id = order["user_id"].to_i
  order_id = order["id"].to_i
  Review.create!(
    rating: rand(1..5),
    content: [Faker::Quote.yoda, Faker::TvShows::TheITCrowd.quote, Faker::Movies::BackToTheFuture.quote].sample,
    order_id: order_id,
    user_id: user_id
    )
}
puts "#{Review.count} Reviews created"

puts "Seeding complete"
