# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create(name: "Fabiano",password: "123")
User.create(name: "Alona", password: "234")
User.create(name: "Dick", password: "345")

Like.create(liker_id: 1, likee_id: 2)
Like.create(liker_id: 1, likee_id: 3)
Like.create(liker_id: 3, likee_id: 1)
