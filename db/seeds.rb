# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: 'Richard', last_name: 'Wu', email: 'example@example.com', password: '11111111', age: 30, education: 4)

99.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: Faker::Number.number(2),
    email: Faker::Internet.unique.email,
    password: (0...8).map { (rand(10)+48).chr }.join,
    education: Faker::Number.between(1, 4)
  )
end

Cohort.create(
  :name => 'spring 2018',
  :start_date => '12-10-2018',
  :end_date => '30-10-2018',
)
