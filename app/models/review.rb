class Review < ApplicationRecord

  belongs_to :genre
  belongs_to :evaluation

  has_one_attached :image
end
