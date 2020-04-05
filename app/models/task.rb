class Task < ApplicationRecord
  belongs_to :category

  validates :title, length: { in: 1..30 }
  validates :description, length: { in: 0..100 }
  validates :deadline, presence: true
end
