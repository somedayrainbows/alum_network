# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    admin: false,
    role: "alumni",
    city: "Denver",
    state: "CO",
    country: "U.S.",
    cohort: "#{rand(12..19)}#{rand(10..12)}"
  )
  puts "10 user seeds created."
end

10.times do
  Event.create!(
    title: Faker::Movies::HarryPotter.house + " meeting",
    date: Faker::Date.between(Date.today, 2.years.from_now),
    event_notes: Faker::Hipster.paragraphs(1)
  )
  puts "10 event seeds created."
end

50.times do
  UserEvent.create!(
    user_id: rand(1..10),
    event_id: rand(1..10)
  )
  puts "50 user_event seeds created."
end
