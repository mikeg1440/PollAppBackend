class Poll < ApplicationRecord
  has_many :answers
  has_many :responses

  accepts_nested_attributes_for :answers
end
