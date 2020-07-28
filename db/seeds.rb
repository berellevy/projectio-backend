# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'

pixabay_key =  ENV['pixabay_key']
pexel_key = ENV['pexel_key']


def pixabay_image_getter(search_terms, key)
    base_url = "https://pixabay.com/api/?key="
    key = key
    query = "&q=" + search_terms 
    params = "&image_type=photo&safesearch=true"
    full_url = base_url + key + query + params
    restClientResponseObject = RestClient.get(full_url)
    jsonButItsAString = restClientResponseObject.body
    workable_hash = JSON.parse(jsonButItsAString)
    workable_hash["hits"].map { |img| img["webformatURL"]}.sample
end

def pexel_image_getter(search_term, key)
    client = Pexels::Client.new(key)
    resp = client.photos.search(search_term)    
    resp.photos.map { |img| img.src["large"] }.sample
end

CartItem.destroy_all
puts "cartItems destroyed"
Item.destroy_all
puts "items destroyed"
Cart.destroy_all
puts "carts destroyed"
User.destroy_all
puts 'users destroyed'
Item.destroy_all
puts 'items destroyed'

10.times do |i|
    User.create(
        name: Faker::Name.name,
        username: "user#{i}",
        password: "1234"
    )
end
puts "10 users created"

100.times do |i|
    name = Faker::Commerce.product_name
    Item.create(
        name: name,
        price: Faker::Commerce.price(range: 5..550),
        description: Faker::Hipster.paragraph,
        image1: pixabay_image_getter(name.split.last, pixabay_key),
        image2: pixabay_image_getter(name.split.last, pixabay_key)
    )
    print "."
end
puts
puts "100 items created"





