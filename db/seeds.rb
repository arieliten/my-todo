# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create!(name: 'Homer Simpsons',
                    email: 'homer@example.com', 
                    password: 'abc123', 
                    password_confirmation: 'abc123')
puts 'New user created: ' << user.name
