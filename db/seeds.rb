# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create(name: "Fabiano",password: "123", remote_avatar_url: "http://s3.amazonaws.com/zacflix/uploads/monk.jpg")
User.create(name: "Alona", password: "234", remote_avatar_url: "https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-9/18700140_10154942083293071_8370634500906125912_n.jpg?oh=d244bfcd552f86e4870bab300ddf9f66&oe=5A9983CF")
# User.create(name: "Dick", password: "345", avatar: "https://scontent-lga3-1.xx.fbcdn.net/v/t31.0-8/1077557_10202205635035119_2040487981_o.jpg?oh=672cd21a02f93a34b93c8692229e3538&oe=5A6192F9")

# Like.create(liker_id: 1, likee_id: 2)
# Like.create(liker_id: 1, likee_id: 3)
# Like.create(liker_id: 3, likee_id: 1)
