class Review < ApplicationRecord

  belongs_to :genre
  belongs_to :evaluation
end
