class Answer < ApplicationRecord
  belongs_to :poll
  has_many :submissions
end
