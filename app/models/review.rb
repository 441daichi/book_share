class Review < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :genre
  belongs_to :evaluation
  has_many   :comments, dependent: :destroy

  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :author, presence: true
  validates :genre_id, presence: true, numericality: { other_than: 0 }
  validates :tag, length: { maximum: 20 }
  validates :evaluation_id, presence: true, numericality: { other_than: 0 }
  validates :impression, length: { maximum: 300 }

  def self.search(search)
    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
  
end
