# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

# rails g resource availability date:date artist:references

Artist.delete_all
Venue.delete_all
Availability.delete_all

a1 = Artist.create(name: "Ben", password: "123", username: "Flatiron Triplet", email_address: "ben@ben.co", artist_genre: "Musician", bio: "A fun loving, freestyling, highflying bunch of misfits who decided to become professional musicians. Number one band from the small town of Hum, which is the smallest town in the world!", phone_number: "07888 888888", instagram: "", spotify: "", profile_picture: "https://media.vanityfair.com/photos/5852ca58972218dd20575570/master/pass/rogue-one-darth-vader-02.jpg")
a2 = Artist.create(name: "Benj", password: "123", username: "Flatiron Duet", email_address: "ben@ben.co", artist_genre: "Comedians", bio: "A fun loving, freestyling, highflying misfit and this other guy who decided to become professional comedians. Number one stand up act from the small town of Hum, which is the smallest town in the world!", phone_number: "07888 888888", instagram: "", spotify: "", profile_picture: "https://4.bp.blogspot.com/-04qvGZQEK20/TlyCRjYKc9I/AAAAAAAAAIU/ILSepZL6APk/s1600/Jussi+Jaaskelainen.jpg")
a2 = Artist.create(name: "Benja", password: "123", username: "Flatiron Singlet", email_address: "ben@ben.co", artist_genre: "Musician", bio: "A fun loving, freestyling, highflying misfit and this other guy who decided to become professional comedians. Number one stand up act from the small town of Hum, which is the smallest town in the world!", phone_number: "07888 888888", instagram: "", spotify: "", profile_picture: "https://4.bp.blogspot.com/-04qvGZQEK20/TlyCRjYKc9I/AAAAAAAAAIU/ILSepZL6APk/s1600/Jussi+Jaaskelainen.jpg")
a2 = Artist.create(name: "Benjam", password: "123", username: "My Fair Ladies", email_address: "ben@ben.co", artist_genre: "Comedians", bio: "A fun loving, freestyling, highflying misfit and this other guy who decided to become professional comedians. Number one stand up act from the small town of Hum, which is the smallest town in the world!", phone_number: "07888 888888", instagram: "", spotify: "", profile_picture: "https://4.bp.blogspot.com/-04qvGZQEK20/TlyCRjYKc9I/AAAAAAAAAIU/ILSepZL6APk/s1600/Jussi+Jaaskelainen.jpg")
a2 = Artist.create(name: "Benjami", password: "123", username: "Here North There", email_address: "ben@ben.co", artist_genre: "Musician", bio: "A fun loving, freestyling, highflying misfit and this other guy who decided to become professional comedians. Number one stand up act from the small town of Hum, which is the smallest town in the world!", phone_number: "07888 888888", instagram: "", spotify: "", profile_picture: "https://4.bp.blogspot.com/-04qvGZQEK20/TlyCRjYKc9I/AAAAAAAAAIU/ILSepZL6APk/s1600/Jussi+Jaaskelainen.jpg")
a2 = Artist.create(name: "Benjamin", password: "123", username: "Narwhal", email_address: "ben@ben.co", artist_genre: "Musician", bio: "A fun loving, freestyling, highflying misfit and this other guy who decided to become professional comedians. Number one stand up act from the small town of Hum, which is the smallest town in the world!", phone_number: "07888 888888", instagram: "", spotify: "", profile_picture: "https://4.bp.blogspot.com/-04qvGZQEK20/TlyCRjYKc9I/AAAAAAAAAIU/ILSepZL6APk/s1600/Jussi+Jaaskelainen.jpg")
a2 = Artist.create(name: "Dad", password: "123", username: "Cosmo", email_address: "ben@ben.co", artist_genre: "Musician", bio: "A fun loving, freestyling, highflying misfit and this other guy who decided to become professional comedians. Number one stand up act from the small town of Hum, which is the smallest town in the world!", phone_number: "07888 888888", instagram: "", spotify: "", profile_picture: "https://4.bp.blogspot.com/-04qvGZQEK20/TlyCRjYKc9I/AAAAAAAAAIU/ILSepZL6APk/s1600/Jussi+Jaaskelainen.jpg")
a2 = Artist.create(name: "Mum", password: "123", username: "King Julian", email_address: "ben@ben.co", artist_genre: "Musician", bio: "A fun loving, freestyling, highflying misfit and this other guy who decided to become professional comedians. Number one stand up act from the small town of Hum, which is the smallest town in the world!", phone_number: "07888 888888", instagram: "", spotify: "", profile_picture: "https://4.bp.blogspot.com/-04qvGZQEK20/TlyCRjYKc9I/AAAAAAAAAIU/ILSepZL6APk/s1600/Jussi+Jaaskelainen.jpg")

date1 = Availability.create(date: "2020-06-29", artist_id: a1.id)
date2 = Availability.create(date: "2020-06-28", artist_id: a2.id)
date3 = Availability.create(date: "2020-06-27", artist_id: a1.id)
date4 = Availability.create(date: "2020-07-26", artist_id: a1.id)
date4 = Availability.create(date: "2020-06-26", artist_id: a1.id)
date4 = Availability.create(date: "2020-09-26", artist_id: a1.id)
date4 = Availability.create(date: "2020-06-24", artist_id: a1.id)
date4 = Availability.create(date: "2020-06-20", artist_id: a1.id)
date4 = Availability.create(date: "2020-06-21", artist_id: a1.id)
date4 = Availability.create(date: "2020-12-26", artist_id: a1.id)

b1 = Venue.create(name: "Strathcona", password: "123", postcode: "H3Y 2ZN", phone_number: "07777 777777")

# rails g resource Venue name
