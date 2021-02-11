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

book_covers = ["https://i1.wp.com/www.thebooksatchel.com/wp-content/uploads/2020/04/best-book-covers-from-India-2019.jpg?fit=1200%2C1500&ssl=1","https://e3t6q7b4.stackpathcdn.com/wp-content/uploads/2018/09/five-feet-apart-9781534437333_hr-679x1024.jpg","https://www.skipprichard.com/wp-content/uploads/2018/12/9781501180989.jpg","https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzMzk4NjYwMzU3/image-placeholder-title.jpg","https://i.pinimg.com/736x/a0/e6/26/a0e626af3883e109da440ec021080f99.jpg","https://d1csarkz8obe9u.cloudfront.net/posterpreviews/action-thriller-book-cover-design-template-3675ae3e3ac7ee095fc793ab61b812cc_screen.jpg?ts=1588152105","https://static01.nyt.com/images/2014/02/05/books/05before-and-after-slide-T6H2/05before-and-after-slide-T6H2-superJumbo.jpg?quality=75&auto=webp&disable=upscale","https://www.quirkbooks.com/sites/default/files/styles/blog_detail_featured_image/public/LastPoliceman_pikachu3.jpg?itok=_TfyN6Q5","https://images.squarespace-cdn.com/content/v1/5ae2fce87e3c3ae275ea2c9f/1526464175408-W92Q4MSAM40I8YF4HM64/ke17ZwdGBToddI8pDm48kG42nK5MxReh9N1Tgs_dc9t7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UXysNIcM8ERoy824r28kfN5DdNsbvYnFI46u1WARIoKesh_vZu_IHrh0xbom9DKbTA/tess-cover.jpg?format=1500w","https://lithub.com/wp-content/uploads/2019/01/81SBy9jbbHL.jpg"]

avatars = ["", "", "", ""]

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
10.times do |idx|
  book_cover = book_covers[idx]
  file = URI.open(book_cover)

  book = Book.new(
    title: Faker::Book.title,
    published_year: rand(1900..2020),
    genre: Faker::Book.genre,
    price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    description: Faker::Quote.matz,
    author_id: Author.all.sample.id
    )
  book.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  book.save!
end
puts "#{Book.count} Users created"


puts "Creating users..."
4.times |idx| {
  avatar = avatars[idx]
  file = URI.open(avatar)
  user = User.create!(
    email: Faker::Internet.email,
    password: 12345678
    )
  user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
}
puts "#{User.count} Users created"

puts "Creating orders..."
20.times {
  Order.create!(
    start_date: Faker::Date.backward(days: 60),
    end_date: Faker::Date.forward(days: 60),
    book_id: Book.all.sample.id,
    user_id: User.all.sample.id
    )
}
puts "#{Order.count} Orders created"

puts "Creating reviews..."
25.times {
  order = Order.all.sample
  user_id = order["user_id"].to_i
  order_id = order["id"].to_i
  Review.create!(
    rating: rand(1..5),
    content: [Faker::Quote.yoda, Faker::Movies::BackToTheFuture.quote].sample,
    order_id: order_id,
    user_id: user_id
    )
}
puts "#{Review.count} Reviews created"

puts "Seeding complete"
