class CourseType < ApplicationRecord
  validates_presence_of :title

  has_many :courses
end
