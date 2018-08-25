class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validate_presence_of :title, :body

  belongs_to :course_type
end
