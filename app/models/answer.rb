class Answer < ApplicationRecord
  belongs_to :poll
  has_many :submissions

  validates :content, presence: true
end
