# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

a = User.create(username: "admin", email: "admin@mail.com", password: "adminadmin", roles_mask: 4)
a.save
m = User.create(username: "mod", email: "mod@mail.com", password: "modmod", roles_mask: 2)
m.save

p "Created admin and mod user" 