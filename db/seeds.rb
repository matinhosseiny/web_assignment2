# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "admin user",
             email: "admin@yahoo.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)
User.create!(name:  "judge1",
             email: "judge1@yahoo.com",
             password:              "foobar",
             password_confirmation: "foobar")
             
             
users = User.order(:created_at).take(6)
2.times do
  team = 1
  users.each { |user| user.scoresheets.create!(teamnumber: team) }
  
end