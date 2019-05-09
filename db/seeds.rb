# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts '######### CLEANING DATABASE #########'
Message.destroy_all
User.destroy_all
Channel.destroy_all
puts '######### DONE #########'

puts '######### CREATING 10 USERS #########'
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8)
  )
end
puts '######### DONE #########'

puts '######### CREATING DEFAULT CHANNELS #########'
['general', 'paris', 'react'].each do |channel_name|
  Channel.create!(name: channel_name)
end
puts '######### DONE #########'

puts '######### CREATING ONE MESSAGE FOR EACH USER IN EACH CHANNEL #########'
User.all.each do |user|
  Channel.all.each do |channel|
    Message.create(user: user, channel: channel, content: Faker::ChuckNorris.fact)
  end
end
puts '######### DONE #########'
