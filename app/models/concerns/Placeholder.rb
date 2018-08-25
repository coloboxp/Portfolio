module Placeholder
  extend ActiveSupport::Concern

  def self.image_generator(height:, width:)
    "https://place-hold.it/#{height}x#{width}"
  end

  def self.image_generator_square(pxsize:)
    image_generator(height: pxsize, width: pxsize)
  end
end