# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

100.times do
  email = Faker::Internet.email
  password = Faker::Lorem.characters(10)
  puts "We are creating a user with email of #{email}"
  User.create!(email: email, password: password)
end

file = File.read('db/data/styles.csv')
csv = CSV.parse(file, :headers => true, :header_converters => :symbol)

csv.each do |row|
  ratebeer_id = row[:ratebeer_id]
  name = row[:name]
  puts "We are creating a style called #{name}"
  Style.create!(ratebeer_id: ratebeer_id, name: name)
end

file = File.read('db/data/beers.csv')
csv = CSV.parse(file, :headers => true, :header_converters => :symbol)

csv.each do |row|
  name = row[:name]
  abv = row[:abv]
  style_id = row[:style_id]
  style = Style.find(style_id).name
  description = Faker::Lorem.sentence
  puts "We are creating a beer with name #{name} and style #{style}"
  Beer.create!(name: name, abv: abv, style_id: style_id, description:description)
end
