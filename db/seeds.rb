# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Video.create(
  title: '30 Rock',
  description: "30 Rock is an American satirical television sitcom created by Tina Fey that ran on NBC from October 11, 2006, to January 31, 2013. The series, based on Fey's experiences as head writer for Saturday Night Live, takes place behind the scenes of a fictional live sketch comedy show depicted as airing on NBC.",
  thumbnail_image_url: '/tmp/30_rock.jpg',
  cover_image_url: '/tmp/30_rock_large.jpg'
)

Video.create(
  title: 'Family Guy',
  description: "Family Guy is an American animated sitcom created by Seth MacFarlane for the Fox Broadcasting Company. The series centers on the Griffins, a family consisting of parents Peter and Lois; their children, Meg, Chris, and Stewie; and their anthropomorphic pet dog, Brian.",
  thumbnail_image_url: '/tmp/family_guy.jpg',
  cover_image_url: 'http://via.placeholder.com/675x375'
)

Video.create(
  title: 'The Office',
  description: "The Office is an American television comedy series that aired on NBC from March 24, 2005, to May 16, 2013. The series depicts the everyday lives of office employees in the Scranton, Pennsylvania, branch of the fictional Dunder Mifflin Paper Company.",
  thumbnail_image_url: '/tmp/the_office.jpg',
  cover_image_url: 'http://via.placeholder.com/675x375'
)
