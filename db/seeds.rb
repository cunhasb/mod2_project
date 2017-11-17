# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# # labels
# hair = Label.create(name: "hair")
# water = Label.create(name: "water")
# car = Label.create(name: "car")
# bicycle = Label.create(name: "bicycle")
# age_20 = Label.create(name: "20")
# age_25 = Label.create(name:"25")
# age_30 = Label.create(name:"30")
# masculine = Label.create(name:"masculine")
# feminine = Label.create(name: "feminine")
# white = Label.create(name: "white")
# black = Label.create(name: "black")
# asian = Label.create(name: "asian")
# latino = Label.create(name: "latino")
#
# # Users
#
# fabiano = User.create(name: "Fabiano",password: "123", remote_avatar_url: "http://s3.amazonaws.com/zacflix/uploads/monk.jpg")
# Profile.create(user_id: fabiano.id)
# Preference.create(user_id: fabiano.id)
# fabiano.profile.labels << age_30
# fabiano.profile.labels << masculine
# fabiano.profile.labels << latino
# fabiano.preference.labels << age_30
# fabiano.preference.labels << feminine
# fabiano.preference.labels << bicycle
#
#
# alona = User.create(name: "Alona", password: "234", remote_avatar_url: "https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-9/18700140_10154942083293071_8370634500906125912_n.jpg?oh=d244bfcd552f86e4870bab300ddf9f66&oe=5A9983CF")
# Profile.create(user_id: alona.id)
# Preference.create(user_id: alona.id)
# alona.profile.labels << age_20
# alona.profile.labels << feminine
# alona.profile.labels << white
# alona.preference.labels << age_30
# alona.preference.labels << masculine
# alona.preference.labels << bicycle
# alona.preference.labels << water
# alona.preference.labels << car
#
#
# dick = User.create(name: "Dick", password: "345", avatar: "https://scontent-lga3-1.xx.fbcdn.net/v/t31.0-8/1077557_10202205635035119_2040487981_o.jpg?oh=672cd21a02f93a34b93c8692229e3538&oe=5A6192F9")
# Profile.create(user_id: dick.id)
# Preference.create(user_id: dick.id)
# dick.profile.labels << age_20
# dick.profile.labels << masculine
# dick.profile.labels << white
# dick.preference.labels << age_20
# dick.preference.labels << feminine
# dick.preference.labels << bicycle
# dick.preference.labels << water
# dick.preference.labels << car

Param.create(app_key: "f40ee57ffed14e4a8ff5f7d165a34be8",filters:"age,gender,multicultural")



# Like.create(liker_id: 1, likee_id: 2)
# Like.create(liker_id: 1, likee_id: 3)
# Like.create(liker_id: 3, likee_id: 1)
