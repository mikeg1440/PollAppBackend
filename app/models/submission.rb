class Submission < ApplicationRecord
  belongs_to :poll
  belongs_to :answer

  validates :poll, presence: true
  validates :answer, presence: true
end
