class PollSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :question, :answers
end
