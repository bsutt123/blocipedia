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
  User.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password',
    role: 'premium'
  )
end

User.create!(
  name: "Brady Sutton",
  email: "bsutt123@gmail.com",
  password: "password",
  password_confirmation: "password",
  role: "admin"
)

User.create!(
  name: "Standard",
  email: "standard@example.com",
  password: "password",
  password_confirmation: "password",
)

User.create!(
  name: "premium",
  email: "premium@example.com",
  password: "password",
  password_confirmation: "password",
  role: "premium"
)


users = User.all
brady = User.find_by_name("Brady Sutton")

10.times do
  article = ""
  10.times do
    article += Faker::Lorem.paragraph(8)+"\\n \\n \\n"
  end
  wiki = Wiki.create!(
    title: Faker::HitchhikersGuideToTheGalaxy.character,
    body: article,
    private: false,
    user: users.sample
  )
end

(1..9).each do |index|
  wiki = Wiki.create!(
    title: "private #{index}",
    body: "private #{index}",
    private: true,
  )
  Collaborator.create!(user: brady, wiki: wiki)
end
wikis = Wiki.all
