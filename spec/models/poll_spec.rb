
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

end
