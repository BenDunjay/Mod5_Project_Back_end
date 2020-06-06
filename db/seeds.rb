# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

# rails g resource availability date:date artist:references

Availability.delete_all
Artist.delete_all

a1 = Artist.create(name: "Ben", password: "123")
a2 = Artist.create(name: "Benny", password: "123")

date1 = Availability.create(date: "2020-06-08", artist_id: a1.id)
date2 = Availability.create(date: "2020-06-09", artist_id: a2.id)
date3 = Availability.create(date: "2020-06-12", artist_id: a1.id)
date4 = Availability.create(date: "2020-06-13", artist_id: a1.id)

# rails g resource Venue name
