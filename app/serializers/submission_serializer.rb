class SubmissionSerializer < ActiveModel::Serializer
  attributes :id, :poll_id, :answer_id
end
