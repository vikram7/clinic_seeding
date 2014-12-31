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
  puts "Creating User with email: #{email} and password: #{password}"
  User.create(email: email, password: password)
end

puts "Users seeded"
sleep 10

file = File.read('db/data/styles.csv')
csv = CSV.parse(file, :headers => true, :header_converters => :symbol)
csv.each do |row|
  puts "create style with name: #{row[:name]}"
  Style.create(ratebeer_id: row[:ratebeer_id], name: row[:name])
end

file = File.read('db/data/beers.csv')
csv = CSV.parse(file, :headers => true, :header_converters => :symbol)
csv.each do |row|
  style_id = row[:style_id]
  name = row[:name]
  style_name = Style.find(style_id).name
  puts "beer with name: #{row[:name]} and style: #{style_name}"
  Beer.create(name: name, style_id: style_id, description: "wow, such good")
end
