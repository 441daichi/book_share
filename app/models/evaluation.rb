class Evaluation < ApplicationRecord
  Evaluation = [
    { id: 0, name: '☆☆☆☆☆' },
    { id: 1, name: '★☆☆☆☆' },
    { id: 2, name: '★★☆☆☆' },
    { id: 3, name: '★★★☆☆' },
    { id: 4, name: '★★★★☆' },
    { id: 5, name: '★★★★★' }
  ]

  has_many :reviews
end
