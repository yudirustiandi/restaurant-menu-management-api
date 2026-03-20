# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding..."

username = ENV.fetch("USER_NAME", "admin")
password = ENV.fetch("USER_PASS", "Admin123!!")

User.find_or_create_by!(name: username) do |u|
  u.password = password
  u.password_confirmation = password
end

warung = Restaurant.find_or_create_by!(name: "Warung Nusantara") do |r|
  r.address = "Jakarta"
  r.phone = "081234567890"
  r.opening_hours = "08:00 - 22:00"
end

cafe = Restaurant.find_or_create_by!(name: "Cafe Kopi Santai") do |r|
  r.address = "Bandung"
  r.phone = "082345678901"
  r.opening_hours = "10:00 - 23:00"
end

menu_items = [
  {
    name: "Nasi Goreng",
    description: "Nasi goreng khas dengan telur dan ayam",
    price: 25000,
    category: "main",
    is_available: true,
    restaurant: warung
  },
  {
    name: "Mie Ayam",
    description: "Mie dengan topping ayam manis gurih",
    price: 20000,
    category: "main",
    is_available: true,
    restaurant: warung
  },
  {
    name: "Sate Ayam",
    description: "Sate ayam dengan bumbu kacang",
    price: 28000,
    category: "appetizer",
    is_available: true,
    restaurant: warung
  },
  {
    name: "Kerupuk",
    description: "Kerupuk renyah sebagai pelengkap",
    price: 5000,
    category: "appetizer",
    is_available: true,
    restaurant: warung
  },
  {
    name: "Es Teh Manis",
    description: "Teh manis dingin segar",
    price: 8000,
    category: "drink",
    is_available: true,
    restaurant: warung
  },
  {
    name: "Cappuccino",
    description: "Kopi espresso dengan susu foam",
    price: 30000,
    category: "drink",
    is_available: true,
    restaurant: cafe
  },
  {
    name: "Latte",
    description: "Kopi susu creamy",
    price: 32000,
    category: "drink",
    is_available: true,
    restaurant: cafe
  },
  {
    name: "Americano",
    description: "Espresso dengan air panas",
    price: 28000,
    category: "drink",
    is_available: true,
    restaurant: cafe
  },
  {
    name: "Croissant",
    description: "Roti pastry renyah",
    price: 28000,
    category: "dessert",
    is_available: true,
    restaurant: cafe
  },
  {
    name: "Cheese Cake",
    description: "Kue keju lembut dan creamy",
    price: 35000,
    category: "dessert",
    is_available: true,
    restaurant: cafe
  }
]

menu_items.each do |item|
  MenuItem.find_or_create_by!(
    name: item[:name],
    restaurant: item[:restaurant]
  ) do |m|
    m.description = item[:description]
    m.price = item[:price]
    m.category = item[:category]
    m.is_available = item[:is_available]
  end
end

puts "Seeding completed!"
