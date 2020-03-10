
require 'rails_helper'

RSpec.describe Answer, type: :model do

  poll = Poll.create(title: "Favorite Harry Potter", author: Faker::Name.first_name, question: 'What is your all time favorite Harry Potter movie?')
  answers = (1..3).map {|num| poll.answers.build(content: Faker::Movies::HarryPotter.book)}
  poll.save


  it 'belongs to a poll' do
    expect(answers[0].poll).to equal(poll)
  end

  it 'is invalid without content' do
    answer = poll.answers.build
    expect(answer).to be_invalid
  end

  it 'has many submissions' do
    submissions = (1..3).map {|sub| poll.submissions.build(answer: answers.sample)}
    expect(submissions.count).to equal(3)
  end

end
