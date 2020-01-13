class Poll < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :answers, through: :questions
  has_many :responses 
end
