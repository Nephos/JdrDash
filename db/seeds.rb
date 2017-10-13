# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Song.create(title: "Power of Darkness (Instrumental)",  youtube_url: 'https://www.youtube.com/watch?v=HPoMypTAxkY', source: "youtube", author: "Two Steps From Hell", duration: 170, loop: false, attr_stress: 60, attr_epicness: 80, attr_happiness: 30, tag_list: "battle")
Song.create(title: "My Freedom",  youtube_url: 'https://www.youtube.com/watch?v=w-y_fx_TNaw', source: "youtube", author: "Two Steps From Hell", duration: 237, loop: false, attr_stress: 0, attr_epicness: 60, attr_happiness: 80, tag_list: ["epic", "calm"])
Song.create(youtube_url: 'https://www.youtube.com/watch?v=ysrkvEds4I8', loop: false, attr_stress: 0, attr_epicness: 0, attr_happiness: 20)
