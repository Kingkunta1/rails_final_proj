# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Sneaker.destroy_all
Brand.destroy_all
User.destroy_all
Store.destroy_all


# ======================== user instances =================================
kenton = User.create(username:"Kenton")
kester = User.create(username:"Kester")
kirk = User.create(username:"Kirk")
miah = User.create(username:"Miah")
arely = User.create(username:"Arely")
samira = User.create(username:"Samira")

# ========================= stores instances ===============================
macys = Store.create(name:"Macys")
foot_locker = Store.create(name:"Foot Locker")
payless = Store.create(name:"Payless")
footware = Store.create(name:"Footware")
flight_club = Store.create(name:"Flight Club")
david_z = Store.create(name:"David z")
# footware = Store.create(name:"Macys")
# ======================= brand instances =====================================
nike = Brand.create(name:"Nike")
puma = Brand.create(name:"puma")
sketcher = Brand.create(name:"Sketcher")
jordan = Brand.create(name:"Jordan")
saucony = Brand.create(name:"Saucony")
new_balance = Brand.create(name:"New Balance")

# ========================== sneaker instances ==================================
true_blood = Sneaker.create(name:"True Blood", shoesize: 9,color:"red",user_id:kenton.id,brand_id:nike.id,store_id:flight_club.id)
sour_bud = Sneaker.create(name:"Sour Bud", shoesize: 8,color:"green",user_id:kester.id,brand_id:puma.id,store_id:foot_locker.id)
lighting = Sneaker.create(name:"Lighting", shoesize: 5,color:"yellow",user_id:kirk.id,brand_id:jordan.id,store_id:macys.id)
subzero = Sneaker.create(name:"Subzero", shoesize: 10,color:"blue",user_id:miah.id,brand_id:sketcher.id,store_id:david_z.id)
lite_mint = Sneaker.create(name:"Lite Mint", shoesize: 10,color:"light green",user_id:samira.id,brand_id:saucony.id,store_id:footware.id)
pearl = Sneaker.create(name:"Pearl", shoesize: 14,color:"White",user_id:arely.id,brand_id:new_balance.id,store_id:payless.id)
crystal = Sneaker.create(name:"Crystal", shoesize: 7,color:"clear",user_id:arely.id,brand_id:nike.id,store_id:flight_club.id)
phantom_menace = Sneaker.create(name:"Phantom Menace", shoesize: 14,color:"black and red",user_id:kenton.id,brand_id:jordan.id,store_id:foot_locker.id)
