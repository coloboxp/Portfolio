class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1}

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :main_image, :thumb_image

  belongs_to :topic
end
