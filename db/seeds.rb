# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(instructor: true, admin: true, first_name: 'Richard', last_name: 'Wu', email: 'example@example.com', password: '11111111', birthday: "1988-03-25".to_date, education: 4)

99.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.birthday(1, 150),
    email: Faker::Internet.unique.email,
    password: (0...8).map { (rand(10)+48).chr }.join,
    education: Faker::Number.between(1, 4),
    avatar: Dir.entries("app/assets/images/portraits")[rand(Dir.entries("app/assets/images/portraits").length)]
  )
end

Cohort.create(
  :name => 'spring 2018',
  :start_date => '12-10-2018',
  :end_date => '30-10-2018',
)
