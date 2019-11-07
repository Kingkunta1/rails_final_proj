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
Category.destroy_all

# ========================== category instances==============================

workout = Category.create(name:"workout")
get_fresh = Category.create(name:"get fresh")
basketball = Category.create(name:"basketball")
football = Category.create(name:"football")
soccer = Category.create(name:"soccer")
wrestlin = Category.create(name:"wrestlin")
running = Category.create(name:"running")

# ======================== user instances =================================

kenton = User.create(username:"Kenton",email:"kenton@email.com",password: "abc123")
kester = User.create(username:"Kester",email:"kester@email.com", password: "abc123")
kirk = User.create(username:"Kirk",email:"kirk@email.com", password: "abc123")
miah = User.create(username:"Miah",email:"miah@email.com", password: " abc123")
arely = User.create(username:"Arely",email:"arely@email.com", password: "abc123")
samira = User.create(username:"Samira",email:"samira@email.com", password: "abc123")

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
true_blood = Sneaker.create(name:"True Blood", shoesize: 9,color:"red",user_id:kenton.id,brand_id:nike.id,store_id:flight_club.id,category_id:get_fresh.id)
sour_bud = Sneaker.create(name:"Sour Bud", shoesize: 8,color:"green",user_id:kester.id,brand_id:puma.id,store_id:foot_locker.id,category_id:get_fresh.id)
lighting = Sneaker.create(name:"Lighting", shoesize: 5,color:"yellow",user_id:kirk.id,brand_id:jordan.id,store_id:macys.id,category_id:running.id)
subzero = Sneaker.create(name:"Subzero", shoesize: 10,color:"blue",user_id:miah.id,brand_id:sketcher.id,store_id:david_z.id,category_id:basketball.id)
lite_mint = Sneaker.create(name:"Lite Mint", shoesize: 10,color:"light green",user_id:samira.id,brand_id:saucony.id,store_id:footware.id,category_id:running.id)
pearl = Sneaker.create(name:"Pearl", shoesize: 14,color:"White",user_id:arely.id,brand_id:new_balance.id,store_id:payless.id,category_id:get_fresh.id)
crystal = Sneaker.create(name:"Crystal", shoesize: 7,color:"clear",user_id:arely.id,brand_id:nike.id,store_id:flight_club.id,category_id:soccer.id)
phantom_menace = Sneaker.create(name:"Phantom Menace", shoesize: 14,color:"black and red",user_id:kenton.id,brand_id:jordan.id,store_id:foot_locker.id,category_id:wrestlin.id)
# phantom_menace = Sneaker.create(name:"Phantom Menace", shoesize: 14,color:"black and red",user_id:kenton.id,brand_id:jordan.id,store_id:foot_locker.id)
