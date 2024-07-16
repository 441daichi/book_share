class Review < ApplicationRecord

  belongs_to :genre
  belongs_to :evaluation

  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :author, presence: true
  validates :genre_id, presence: true, numericality: { other_than: 0 }
  validates :tag, numericality: { only_integer: true, less_than_or_equal_to: 20 }
  validates :evaluation_id, presence: true, numericality: { other_than: 0 }
  validates :impression, numericality: { only_integer: true, less_than_or_equal_to: 300 }
end
