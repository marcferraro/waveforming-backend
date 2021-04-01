# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Ooutput.destroy_all
Input.destroy_all
Star.destroy_all
Color.destroy_all

avatar1 = File.open('public/uploads/user/avatar/1/komet.jpeg')
user1 = User.new(name: "Marc", username: "marcus", password: "123", password_confirmation: "123", avatar: avatar1)
user1.save

avatar2 = File.open('public/uploads/user/avatar/2/bear.jpeg')
user2 = User.new(name: "Alex", username: "akthegiant", password: "123", password_confirmation: "123", avatar: avatar1)
user2.save