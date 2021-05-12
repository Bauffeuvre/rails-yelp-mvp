
puts "Creating 5 Restaurants..."

5.times do
  name = Faker::Restaurant.name
  address = Faker::Address.street_address
  category = ["chinese", "italian", "japanese", "french", "belgian"].sample
  restaurant = Restaurant.create!(name:name ,address: address, category: category )
  puts "Creating Restaurant #{restaurant.id}"
end

puts "Finished !"