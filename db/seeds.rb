# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  User.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password'
  )
end
users = User.all

50.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::HitchhikersGuideToTheGalaxy.character,
    body: Faker::HitchhikersGuideToTheGalaxy.quote,
    private: false,
  )
end
