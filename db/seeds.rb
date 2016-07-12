# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

condition_arr = ["Good", "Fair", "Bad", "Absolute Shit"]

product_image = {
  "plate" => "http://www.bluepheasant.com/media/catalog/product/cache/1/image/1800x/040ec09b1e35df139433887a97daa66f/b/l/bluepheasant_eleni_white_plates.jpg",
  "lamp" => "http://ab.weimgs.com/weimgs/ab/images/wcm/products/201616/0062/small-pillar-table-lamp-marble-c.jpg",
  "shirt" => "http://www.chainmail.net/images/uploads/steel-shirt-front.jpg",
  "pants" => "https://cdnc.lystit.com/photos/7b10-2014/07/22/berek-gold-copper-reptile-print-pants-6-product-1-21937480-3-928234625-normal.jpeg",
  "bottle" => "http://previews.123rf.com/images/rednaxel/rednaxel1002/rednaxel100200080/6452416-wooden-bottle-and-wineglass-Stock-Photo.jpg",
  "default" => "https://cdn-ssl.s7.disneystore.com/is/image/DisneyShopping/7512055880150"
}

5.times do
  Product.create!(name: Faker::Commerce.product_name,
                  price: rand(1..100).round,
                  condition: condition_arr.sample,
                  on_clearance: rand(0..1),
                  quantity: rand(1..100)
                  )
end

Product.all.each do |prod|
  if prod.name.downcase.include?("plate")
    prod.photo_url = product_image.fetch("plate")
    prod.save
  elsif prod.name.downcase.include?("lamp")
    prod.photo_url = product_image.fetch("lamp")
    prod.save
  elsif prod.name.downcase.include?("shirt")
    prod.photo_url = product_image.fetch("shirt")
    prod.save
  elsif prod.name.downcase.include?("pants")
    prod.photo_url = product_image.fetch("pants")
    prod.save
  elsif prod.name.downcase.include?("bottle")
    prod.photo_url = product_image.fetch("bottle")
    prod.save
  else
    prod.photo_url = product_image.fetch("default")
    prod.save
  end
end
