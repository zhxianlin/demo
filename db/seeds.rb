# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!( :name => "conf" )
Category.create!( :name => "Meeting" )
Category.create!( :name => "kaigi" )

Group.create!( :name => "Ruby" )
Group.create!( :name => "Java" )
Group.create!( :name => "JavaScript" )
