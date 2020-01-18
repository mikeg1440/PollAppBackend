# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# Create a poll for favorite movies

potter_poll = Poll.create(title: "Favorite Harry Potter", author: Faker::Name.first_name, question: 'What is your all time favorite Harry Potter movie?')

(1..3).each {|num| potter_poll.answers.build(content: Faker::Movies::HarryPotter.book)}

potter_poll.save


# Create a poll for favorite Star Wars quote

starwars_poll = Poll.create(title: 'Best Star Wars Quote', author: Faker::Name.first_name, question: 'What is the best quote in the Star Wars saga?')

(1..5).each {|num| starwars_poll.answers.build(content: Faker::Movies::StarWars.quote)}

starwars_poll.save


# Create a poll for favorite charecter in the Lord of the Rings stories

lor_poll = Poll.create(title: 'Favorite Lord of The Rings Charecter', author: Faker::Name.first_name, question: 'Who is your favorite charecter in the Lord of the Rings stories?')

(1..6).each do |num|

  # loop until we have a charecter that doesn't exist already as a answer
  charecter = Faker::Movies::LordOfTheRings.character
  until !Answer.exists?(content: charecter)
    charecter = Faker::Movies::LordOfTheRings.character
  end

  lor_poll.answers.build(content: character)
end

lor_poll.save
