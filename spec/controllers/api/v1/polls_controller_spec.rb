
require 'rails_helper'

RSpec.describe Api::V1::PollsController, type: :controller do

  describe 'GET index' do

    it 'has a 200 status code' do
      Poll.create(title: "Favorite Harry Potter", author: Faker::Name.first_name, question: 'What is your all time favorite Harry Potter movie?')
      get :index
      expect(response.status).to equal(200)
    end

    it 'returns json as a response' do
        Poll.create(title: "Favorite Harry Potter", author: Faker::Name.first_name, question: 'What is your all time favorite Harry Potter movie?')
        get :index
        puts response.content_type
        expect(response.content_type).to include('application/json')
    end

    # it 'returns all existing polls' do
    #   poll = Poll.create(title: "Favorite Harry Potter", author: Faker::Name.first_name, question: 'What is your all time favorite Harry Potter movie?')
    #   get :index
    #   puts response.body
    #   expect(response.body.last).to include(poll.to_json)
    # end

  end


  # describe 'GET show' do
  #   it 'shows the spefic poll' do
  #     get :show, params: {poll: {id: 1}}
  #     expect(response.body).to include(Poll.all.first)
  #   end
  # end

end
