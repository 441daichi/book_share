class Evaluation < ApplicationRecord
  EVALUATIONS = [
    { id: 0, name: '☆☆☆☆☆' },
    { id: 1, name: '★☆☆☆☆' },
    { id: 2, name: '★★☆☆☆' },
    { id: 3, name: '★★★☆☆' },
    { id: 4, name: '★★★★☆' },
    { id: 5, name: '★★★★★' }
  ]


  def self.all_evaluations
    EVALUATIONS
  end

  has_many :reviews
end
