# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

comedy = Category.create(name: 'Comedy')
scifi = Category.create(name: 'Science Fiction & Fantasy')

rock_30 = Video.create(
  title: '30 Rock',
  description: "30 Rock is an American satirical television sitcom created by Tina Fey that ran on NBC from October 11, 2006, to January 31, 2013. The series, based on Fey's experiences as head writer for Saturday Night Live, takes place behind the scenes of a fictional live sketch comedy show depicted as airing on NBC.",
  thumbnail_image_url: '/tmp/30_rock.jpg',
  cover_image_url: '/tmp/30_rock_large.jpg',
  category_id: comedy.id
)

family_guy = Video.create(
  title: 'Family Guy',
  description: "Family Guy is an American animated sitcom created by Seth MacFarlane for the Fox Broadcasting Company. The series centers on the Griffins, a family consisting of parents Peter and Lois; their children, Meg, Chris, and Stewie; and their anthropomorphic pet dog, Brian.",
  thumbnail_image_url: '/tmp/family_guy.jpg',
  cover_image_url: 'http://via.placeholder.com/675x375',
  category_id: comedy.id
)

the_office = Video.create(
  title: 'The Office',
  description: "The Office is an American television comedy series that aired on NBC from March 24, 2005, to May 16, 2013. The series depicts the everyday lives of office employees in the Scranton, Pennsylvania, branch of the fictional Dunder Mifflin Paper Company.",
  thumbnail_image_url: '/tmp/the_office.jpg',
  cover_image_url: 'http://via.placeholder.com/675x375',
  category_id: comedy.id
)

got = Video.create(
  title: 'Game of Thrones',
  description: "Set on the fictional continents of Westeros and Essos, Game of Thrones has several plot lines and a large ensemble cast but centers on three primary story arcs. The first story arc centers on the Iron Throne of the Seven Kingdoms and follows a web of alliances and conflicts among the dynastic noble families either vying to claim the throne or fighting for independence from the throne. The second story arc focuses on the last descendant of the realm's deposed ruling dynasty, exiled and plotting a return to the throne. The third story arc centers on the longstanding brotherhood charged with defending the realm against the ancient threats of the fierce peoples and legendary creatures that lie far north, and an impending winter that threatens the realm.",
  thumbnail_image_url: '/tmp/got.png',
  cover_image_url: 'http://via.placeholder.com/675x375',
  category_id: scifi.id
)

daily_show = Video.create(
  title: 'The Daily Show with Jon Stewart',
  description: 'The Daily Show is an American late-night talk and news satire television program.',
  thumbnail_image_url: '/tmp/the_daily_show.jpg',
  cover_image_url: 'http://via.placeholder.com/675x375',
  category_id: comedy.id
)

last_week_tonight = Video.create(
  title: 'Last Week Tonight',
  description: 'An American late-night talk and news satire television program hosted by comedian John Oliver.',
  thumbnail_image_url: '/tmp/last_week_tonight.jpg',
  cover_image_url: 'http://via.placeholder.com/675x375',
  category_id: comedy.id
)

south_park = Video.create(
  title: 'South Park',
  description: 'An American adult animated sitcom created by Trey Parker and Matt Stone and developed by Brian Graden for the Comedy Central television network. The show revolves around four boys—Stan Marsh, Kyle Broflovski, Eric Cartman, and Kenny McCormick—and their bizarre adventures in and around the titular Colorado town.',
  thumbnail_image_url: '/tmp/south_park.jpg',
  cover_image_url: 'http://via.placeholder.com/675x375',
  category_id: comedy.id
)

futurama = Video.create(
  title: 'Futurama',
  description: 'Futurama is an American animated science fiction comedy series created by Matt Groening for the Fox Broadcasting Company. The series follows the adventures of a late-20th-century New York City pizza delivery boy, Philip J. Fry, who, after being unwittingly cryogenically frozen for one thousand years, finds employment at Planet Express, an interplanetary delivery company in the retro-futuristic 31st century.',
  thumbnail_image_url: '/tmp/futurama.jpg',
  cover_image_url: 'http://via.placeholder.com/675x375',
  category_id: comedy.id
)
