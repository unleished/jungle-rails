# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

user1 = User.create!({
  first_name: "Bey",
  last_name: "Yonce",
  email: "qu33nB@bey.com",
  password_digest: "beyonce"
})

cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 23,
  price: 2_483.75
})

rev1 = Review.create!({
  product_id: 1,
  user_id: 1,
  description: "Lorem ipsum dolor amet wayfarers cardigan literally plaid semiotics. Ut subway tile eiusmod fugiat polaroid succulents prism chicharrones edison bulb stumptown reprehenderit mollit kitsch. ",
  rating: 4
})

rev2 = Review.create!({
  product_id: 4,
  user_id: 1,
  description: "Butcher palo santo neutra ugh portland. Aute est gastropub tbh fashion axe ugh.",
  rating: 4
})

rev3 = Review.create!({
  product_id: 7,
  user_id: 1,
  description: "Truffaut unicorn yr exercitation dolore polaroid man bun adaptogen banh mi fanny pack helvetica authentic farm-to-table. Williamsburg ex incididunt cillum cloud bread anim officia, single-origin coffee humblebrag neutra.",
  rating: 2
})

rev4 = Review.create!({
  product_id: 1,
  user_id: 1,
  description: "Authentic pabst non pitchfork, letterpress before they sold out craft beer unicorn magna kale chips vape eiusmod tbh. Flexitarian fam schlitz organic swag, asymmetrical jianbing kickstarter pop-up franzen. ",
  rating: 3
})

rev5 = Review.create!({
  product_id: 6,
  user_id: 1,
  description: "Vinyl banh mi 8-bit meditation enamel pin commodo ennui ullamco heirloom. XOXO biodiesel non, chia in man braid butcher jianbing neutra green juice gastropub thundercats raclette.",
  rating: 5
})

puts "DONE!"
