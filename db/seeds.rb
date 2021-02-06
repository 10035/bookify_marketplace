# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

img_urls = ["https://i.picsum.photos/id/722/200/200.jpg?hmac=wNug9Ox95uwU6niL7InSfuJXj6KQLckDilJExPwv75Q", "https://i.picsum.photos/id/195/200/200.jpg?hmac=XbxBxpgP4z7t-dGvrqGicWMyRkF_t0suZz3RqiOsY64", "https://i.picsum.photos/id/880/200/200.jpg?hmac=g5VV-eqqKk9TdTvkzKu6PzjRtzrqVhrj6v7H9ZT7PDo" ,"https://i.picsum.photos/id/659/200/200.jpg?hmac=kFpdD3XTBGwPUAH1tD-AiWigstjIX8WGIcyySuVQIvE", "https://i.picsum.photos/id/1/200/200.jpg?hmac=jZB9EZ0Vtzq-BZSmo7JKBBKJLW46nntxq79VMkCiBG8", "https://i.picsum.photos/id/134/200/200.jpg?hmac=a3L-JjVSGeG8w3SdNpzxdh8WSC0xHJXgeD6QryCK7pU", "https://i.picsum.photos/id/194/200/200.jpg?hmac=f1VYjvgDG_6vPwJyTb-Xl1HpXKM23stmhFUnmPE_yL8", "https://i.picsum.photos/id/556/200/200.jpg?hmac=5uOJ4fW7ElE2P5NfHlvz2zx4d99Ts2-lxy8tucygHLc", "https://i.picsum.photos/id/505/200/200.jpg?hmac=c295sjTIAZ_9Gj-PENrzAbATNIiWPL1dmhIhWndYnyo", "https://i.picsum.photos/id/66/200/200.jpg?hmac=gaKXe-rWmo5fSEm79TTkW_yFJLECw3FdRCh6Dm7jp4g", "https://i.picsum.photos/id/203/200/200.jpg?hmac=fydyJjsULq7iMwTTIg_m6g_PQQ1paJrufNsEiqbJRsg"]

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
    img_url: img_urls.sample,
    author_id: Author.all.map {|author| author.id}.sample
    )
}

2.times {
  User.create!(
    email: Faker::Internet.email,
    password: 12345678
    )
}
