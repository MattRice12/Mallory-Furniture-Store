# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DESK_PIC1 = "http://s7d4.scene7.com/is/image/roomandboard/?layer=0&size=498,400&scl=1&src=169822_wood_C&layer=comp&"
DESK_PIC2 = "https://i.kinja-img.com/gawker-media/image/upload/s--NZlkM2pq--/c_fit,fl_progressive,q_80,w_636/l26zsbvf3qvyx7ajpvxb.jpg"
DESK_PIC3 = "http://cubeme.com/blog/wp-content/uploads/2008/04/kit-in-box1.jpg"

CHAIR_PIC1 = "http://stuffpoint.com/cat/image/265083-cat-the-chair-is-mine.jpg"
CHAIR_PIC2 = "http://i.imgur.com/dZrUW.png"
CHAIR_PIC3 = "http://www.americanbeautyequipment.com/Pink%20Cat%20Pedicure%20Chair.jpg"

PILLOW_PIC1 = "https://img0.etsystatic.com/130/0/10833950/il_fullxfull.868463898_qz9v.jpg"
PILLOW_PIC2 = "http://furiousshirley.com/blog/wp-content/uploads/2011/07/tweedycat.jpg"
PILLOW_PIC3 = "https://s-media-cache-ak0.pinimg.com/236x/c0/89/78/c08978e66c64be3e8e3a02cdc3be5697.jpg"

BED_PIC1 = "http://www.homeharmonizing.com/wp-content/uploads/2014/05/Cat-Bed-from-Cedel-Pets-Style.jpg"
BED_PIC2 = "http://g02.a.alicdn.com/kf/HTB1MnepJFXXXXatXFXXq6xXFXXXQ/3D-Oil-Cat-Bedding-Sets-3-4pc-duvet-cover-without-filler-100-Polyester-Queen-King-Size.jpg"
BED_PIC3 = "https://cdn-img-0.wanelo.com/p/894/143/8e4/916079e466130135595fe2a/full_size.jpg"

COUCH_PIC1 = "http://www.freshdesignpedia.com/wp-content/uploads/pamper-your-cat-with-one-cosy-switch-cat-bed/house-cat-pampered-cat-furniture-bed-chic-sofa.jpg"
COUCH_PIC2 = "https://media0.giphy.com/media/2RzaVmwjhFaLe/200_s.gif"
COUCH_PIC3 = "https://s-media-cache-ak0.pinimg.com/236x/c6/e4/6f/c6e46f96d1cb50ff0311b18c7f8cdb34.jpg"

RUG_PIC1 = "http://www.craftster.org/pictures/data/500/206593_20Oct12_DSC02752_resize.JPG"
RUG_PIC2 = "https://i.ytimg.com/vi/S6Q9O_HU_wo/maxresdefault.jpg"
RUG_PIC3 = "https://s-media-cache-ak0.pinimg.com/564x/d8/7f/fe/d87ffe1676d3c6f54c94c4f852ac7353.jpg"

DEFAULT_PIC = "https://cdn-ssl.s7.disneystore.com/is/image/DisneyShopping/7512055880150"

adjective_attribute = ["Sassy", "Small", "Fat", "Sexy", "Fuzzy"]
adjective_textile = ["Wooden", "Cotton", "Diamond", "Down", "Wet", "Sturdy", "Silver", "Hairy"]
product_type_arr = ["Desk", "Chair", "Pillow", "Bed", "Couch", "Rug"]

kategory = ["Desks", "Chairs", "Pillows", "Beds", "Couches", "Rugs"]

condition_arr = ["Good", "Fair", "Bad", "Absolute Shit"]
product_image = {
                 "desk" => [DESK_PIC1, DESK_PIC2, DESK_PIC3],
                 "chair" => [CHAIR_PIC1, CHAIR_PIC2, CHAIR_PIC3],
                 "pillow" => [PILLOW_PIC1, PILLOW_PIC2, PILLOW_PIC3],
                 "bed" => [BED_PIC1, BED_PIC2, BED_PIC3],
                 "couch" => [COUCH_PIC1, COUCH_PIC2, COUCH_PIC3],
                 "rug" => [RUG_PIC1, RUG_PIC2, RUG_PIC3],
                 "default" => [DEFAULT_PIC]
                }

kategory.each do |cat|
  category = Category.create(title: "#{cat}")

  5.times do
    Product.create!(name: "#{adjective_attribute.sample} #{adjective_textile.sample} #{product_type_arr.sample}",
                    price: rand(1..1000).round,
                    condition: condition_arr.sample,
                    on_clearance: rand(0..1),
                    quantity: rand(1..20),
                    category_id: category.id
                    )
  end
end

Product.all.each do |prod|
  if prod.name.downcase.include?("desk")
    prod.prod_url = product_image.fetch("desk").sample
    prod.save
  elsif prod.name.downcase.include?("chair")
    prod.prod_url = product_image.fetch("chair").sample
    prod.save
  elsif prod.name.downcase.include?("pillow")
    prod.prod_url = product_image.fetch("pillow").sample
    prod.save
  elsif prod.name.downcase.include?("bed")
    prod.prod_url = product_image.fetch("bed").sample
    prod.save
  elsif prod.name.downcase.include?("couch")
    prod.prod_url = product_image.fetch("couch").sample
    prod.save
  elsif prod.name.downcase.include?("rug")
    prod.prod_url = product_image.fetch("rug").sample
    prod.save
  else
    prod.prod_url = product_image.fetch("default")
    prod.save
  end
end

Product.all.each do |prod|
  if prod.name.downcase.include?("desk")
    prod.category_id = 1
    prod.save
  elsif prod.name.downcase.include?("chair")
    prod.category_id = 2
    prod.save
  elsif prod.name.downcase.include?("pillow")
    prod.category_id = 3
    prod.save
  elsif prod.name.downcase.include?("bed")
    prod.category_id = 4
    prod.save
  elsif prod.name.downcase.include?("couch")
    prod.category_id = 5
    prod.save
  elsif prod.name.downcase.include?("rug")
    prod.category_id = 6
    prod.save
  end
end

Category.all.each do |cats|
  if cats.title.downcase.include?("desk")
    cats.cat_url = product_image.fetch("desk").second
    cats.save
  elsif cats.title.downcase.include?("chair")
    cats.cat_url = product_image.fetch("chair").first
    cats.save
  elsif cats.title.downcase.include?("pillow")
    cats.cat_url = product_image.fetch("pillow").first
    cats.save
  elsif cats.title.downcase.include?("bed")
    cats.cat_url = product_image.fetch("bed").first
    cats.save
  elsif cats.title.downcase.include?("couch")
    cats.cat_url = product_image.fetch("couch").first
    cats.save
  elsif cats.title.downcase.include?("rug")
    cats.cat_url = product_image.fetch("rug").first
    cats.save
  else
    cats.cat_url = product_image.fetch("default")
    cats.save
  end
end
