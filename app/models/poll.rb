class Poll < ApplicationRecord
  has_many :answers
  has_many :submissions

  accepts_nested_attributes_for :answers

  validates :title, presence: true
  validates :author, presence: true
  validates :question, presence: true
  
end
