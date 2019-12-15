# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Device.create(name: "tv", status: "on", current_consumption: "20w", location: "livingroom")
Device.create(name: "microwave", status: "off", current_consumption: "0w", location: "kitchen")
Device.create(name: "toaster", status: "off", current_consumption: "0w", location: "kitchen")
Device.create(name: "washing machine", status: "on", current_consumption: "30w", location: "bathroom")
Device.create(name: "lamp", status: "on", current_consumption: "10w", location: "livingroom" )

User.create(email: "bob@mail.com", password: "1234", password_confirmation: "1234")
User.create(email: "harry@mail.com", password: "1124", password_confirmation: "1124")
