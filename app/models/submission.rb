class Submission < ApplicationRecord
  belongs_to :poll
  belongs_to :question
  belongs_to :answer 
end
