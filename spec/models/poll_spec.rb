
require 'rails_helper'

RSpec.describe Poll, type: :model do


  it 'is valid with a title, author and question' do
    poll = Poll.create(title: "Favorite Harry Potter", author: Faker::Name.first_name, question: 'What is your all time favorite Harry Potter movie?')
    expect(poll).to be_valid
  end

  it 'is not valid without a title' do
    poll = Poll.create(author: Faker::Name.first_name, question: 'What is your all time favorite Harry Potter movie?')
    expect(poll).to be_invalid
  end

  it 'is not valid without a author' do
    poll = Poll.create(title: "Favorite Harry Potter", question: 'What is your all time favorite Harry Potter movie?')
    expect(poll).to be_invalid
  end

  it 'is not valid without a question' do
    poll = Poll.create(title: "Favorite Harry Potter", author: Faker::Name.first_name)
    expect(poll).to be_invalid
  end

  poll = Poll.create(title: "Favorite Harry Potter", author: Faker::Name.first_name, question: 'What is your all time favorite Harry Potter movie?')
  (1..3).each {|num| poll.answers.build(content: Faker::Movies::HarryPotter.book)}
  poll.save

  it 'has many answers' do
    expect(poll.answers.count).to equal(3)
  end

  it 'has many submissions' do
    (1..5).each {|sub| poll.submissions.build(answer: poll.answers.sample)}
    poll.save
    expect(poll.submissions.count).to equal(5)
  end

end
